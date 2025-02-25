//
//  ContentView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 20/01/25.
//

import SwiftUI
import UIKit
import CoreML
import Foundation
import Accelerate

@MainActor
class GPT2Model: ObservableObject {
    
    func generateCompletion(for sentenceFragment: String, maxTokens: Int = 6, temperature: Float = 0.9, repetitionPenalty: Float = 1.6) -> String {
        // Load the CoreML Model
        let model = try! mygpt2(configuration: MLModelConfiguration())
        
        // Tokenizer
        let tokenizer = GPT2Tokenizer()
        var inputIDs = tokenizer.encode(text: sentenceFragment) // Encode initial text
        
        // Set a maximum input size to prevent overflow
        let maxContextSize = 32 // Adjust if needed
        
        for _ in 0..<maxTokens {
            // Limit input to the last `maxContextSize` tokens
            let truncatedInputIDs = Array(inputIDs.suffix(maxContextSize))

            // Convert inputIDs to MLMultiArray
            let inputArray = try! MLMultiArray(shape: [NSNumber(value: truncatedInputIDs.count)], dataType: .int32)
            for (index, value) in truncatedInputIDs.enumerated() {
                inputArray[index] = NSNumber(value: value)
            }
            
            // Prepare Model Input
            let input = mygpt2Input(context: inputArray)
            
            do {
                // Run Model Prediction
                let predictionOutput = try model.prediction(input: input)
                let logitsArray = predictionOutput.var_1014ShapedArray // Extract logits
                
                var logits = logitsArray.scalars // Convert to Swift array
                let vocabSize = logitsArray.shape.last! // Last dimension is vocab size
                
                // Apply Repetition Penalty: Reduce probability of repeating tokens
                for token in Set(inputIDs) {
                    logits[token] /= repetitionPenalty
                }
                
                // Apply Temperature-based Sampling
                let probabilities = softmax(logits.suffix(vocabSize).map { $0 / temperature })
                let tokenIndex = sampleFromDistribution(probabilities)
                
                // Stop if end-of-text token is generated (50256 for GPT-2)
                if tokenIndex == 50256 {
                    break
                }
                
                // Append token to sequence
                inputIDs.append(tokenIndex)
                
                // Avoid generating too much
                if inputIDs.count >= maxTokens {
                    break
                }
            } catch {
                print("Prediction failed: \(error)")
                break
            }
        }
        
        // Decode full generated sequence
        let completionText = tokenizer.decode(tokens: inputIDs)
        print(completionText)
        return completionText
    }

    // Softmax Function (Convert logits to probabilities)
    func softmax(_ values: [Float]) -> [Float] {
        let maxLogit = values.max() ?? 0
        let expValues = values.map { exp($0 - maxLogit) }
        let sumExpValues = expValues.reduce(0, +)
        return expValues.map { $0 / sumExpValues }
    }

    // Sampling Function (Randomly pick a token based on probability distribution)
    func sampleFromDistribution(_ probabilities: [Float]) -> Int {
        let randomValue = Float.random(in: 0...1)
        var cumulative: Float = 0
        for (index, probability) in probabilities.enumerated() {
            cumulative += probability
            if randomValue < cumulative {
                return index
            }
        }
        return probabilities.count - 1 // Fallback (should rarely happen)
    }

}

struct ContentView: View {
    @State var showTextField = false
    @State var showYume = false
    @State var page = 0
    @State var text = "Click on the button to see our spell complete the missing parts!"
    @State private var completedSentence: String = "Generating..."
    @State private var textField: String = "By the power of the eternal flame, I call upon the"
    private let tokenizer = GPT2Tokenizer()
    @StateObject private var gpt2Model = GPT2Model()

    var body: some View {
        GeometryReader { _ in
            ZStack{
                Image("backgroundmagic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: getWidth(), height: getHeight())
                    .offset(x:-10, y:0)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack{
                        Image("magicbook")
                            .offset(x:-10, y:0)
                        
                        if !showTextField{
                            Text(textField)
                                .font(Font.custom("Pixelify Sans", size: 18))
                                .frame(width: 130)
                                .foregroundStyle(.black)
                                .offset(x:-85, y: -80)
                        }
                        else{
                            if textField == "" {
                                Text("Write your own enchantment...")
                                    .font(Font.custom("Pixelify Sans", size: 18))
                                    .frame(width: 130)
                                    .foregroundStyle(.gray)
                                    .offset(x:-85, y: -60)
                            }
                            TextField("", text: $textField)
                               .font(Font.custom("Pixelify Sans", size: 18))
                               .frame(width: 130)
                               .foregroundStyle(.black)
                               .offset(x:-85, y: -60)
                        }
                        
                        Text("Output:")
                            .font(Font.custom("Pixelify Sans", size: 20))
                            .frame(width: 100)
                            .foregroundStyle(.black)
                            .offset(x:50, y: -140)
                        Text(completedSentence)
                            .font(Font.custom("Pixelify Sans", size: 18))
                            .frame(width: 140)
                            .foregroundStyle(.black)
                            .offset(x:70, y: -20)
                    }
                    
                    if !showYume {
                        Button(action: {
                            
                            completedSentence = gpt2Model.generateCompletion(for: textField)
                            
                            AudioManager.shared.playSoundEffect(named: "wand")
                            
                        }) {
                            Image("magicbutton")
                                .offset(x:-10, y:0)
                        }
                        
                        ZStack{
                            Image("commentYume")
                                .offset(x:-10, y: 50)
                            
                            Text(text)
                            .font(Font.custom("Pixelify Sans", size: 20))
                            .frame(width: 220, height: 200)
                            .foregroundStyle(.black)
                            .offset(x:40, y: 50)
                            .lineLimit(6)
                            
                            Button {
                                completedSentence = ""
                                if page == 0{
                                    textField = "I summon the snow and fire to do the"
                                }
                                else if page == 1{
                                    textField = ""
                                    showTextField.toggle()
                                    text = "Write your own spell and see how the magic completes it"
//                                    textField = "And in the echoes of time, I let my destiny be"
                                }
                                else if page == 2{
                                    showYume.toggle()
                                }
                                page += 1
                            }
                            label: {
                                ZStack{
                                    Image("arrow")
                                        .resizable()
                                        .frame(width: 80, height: 40)
                                }
                            }
                            .offset(x: 130, y: 100)
                            .navigationDestination(isPresented: $showYume){
                                AdviceView()
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)
                            }
                        }
                    }
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
}
