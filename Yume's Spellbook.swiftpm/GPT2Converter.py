from transformers import GPT2LMHeadModel, GPT2Tokenizer, GPT2Config

import torch
import numpy as np
from transformers import AutoModelForCausalLM, AutoTokenizer

import coremltools as ct

from coremltools.optimize.coreml import (
    OptimizationConfig,
    OptimizationConfig,
    linear_quantize_weights,
    OpPalettizerConfig,
    palettize_weights,
)
import os

os.environ["COREMLTOOLS_NUM_THREADS"] = "1"  # Reduce CPU usage
os.environ["OMP_NUM_THREADS"] = "1"

torch.cuda.empty_cache()
torch.set_printoptions(edgeitems=3, precision=4)

import torch
import torch.nn as nn

// Load the GPT-2 configuration and model
config = GPT2Config.from_pretrained("gpt2")
config.torchscript = True

// Load the model with the modified configuration
token_predictor = GPT2LMHeadModel.from_pretrained("gpt2", config=config).eval()

pruned_layers = token_predictor.transformer.h[:8]  # Keep only the first 6 blocks
token_predictor.transformer.h = torch.nn.ModuleList(pruned_layers)

// Trace the Token Predictor
random_tokens = torch.randint(10000, (5,))

traced_token_predictor = torch.jit.trace(token_predictor, random_tokens)

// Script the Outer Loop
scripted_model = torch.jit.script(traced_token_predictor)

// Convert to Core ML
mlmodel = ct.convert(
    scripted_model,
    inputs=[ct.TensorType(name="context", shape=(ct.RangeDim(1, 32),), dtype=np.int32)],
)

op_config = OpPalettizerConfig(mode="kmeans", nbits=2)  # Use 4-bit weight clusters
palettization_config = OptimizationConfig(global_config=op_config)
mlmodel_palettized = palettize_weights(mlmodel, config=palettization_config)

op_config = ct.optimize.coreml.OpLinearQuantizerConfig(
    mode="linear_symmetric",
    dtype="int8",
    granularity="per_block",
    block_size=32,
)

// Apply quantization
config = OptimizationConfig(global_config=op_config)
mlmodel_int8 = linear_quantize_weights(mlmodel_palettized, config=config)  # Use the correct model name

mlmodel_int8.save("mygpt2.mlpackage")
