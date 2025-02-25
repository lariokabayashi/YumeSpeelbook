//
// mygpt2.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
class mygpt2Input : MLFeatureProvider {

    /// context as 1 element vector of 32-bit integers
    var context: MLMultiArray

    var featureNames: Set<String> { ["context"] }

    func featureValue(for featureName: String) -> MLFeatureValue? {
        if featureName == "context" {
            return MLFeatureValue(multiArray: context)
        }
        return nil
    }

    init(context: MLMultiArray) {
        self.context = context
    }

    convenience init(context: MLShapedArray<Int32>) {
        self.init(context: MLMultiArray(context))
    }

}


/// Model Prediction Output Type
@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
class mygpt2Output : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// var_1014 as multidimensional array of floats
    var var_1014: MLMultiArray {
        provider.featureValue(for: "var_1014")!.multiArrayValue!
    }

    /// var_1014 as multidimensional array of floats
    var var_1014ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(var_1014)
    }

    /// key_1 as multidimensional array of floats
    var key_1: MLMultiArray {
        provider.featureValue(for: "key_1")!.multiArrayValue!
    }

    /// key_1 as multidimensional array of floats
    var key_1ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_1)
    }

    /// value_1 as multidimensional array of floats
    var value_1: MLMultiArray {
        provider.featureValue(for: "value_1")!.multiArrayValue!
    }

    /// value_1 as multidimensional array of floats
    var value_1ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_1)
    }

    /// key_5 as multidimensional array of floats
    var key_5: MLMultiArray {
        provider.featureValue(for: "key_5")!.multiArrayValue!
    }

    /// key_5 as multidimensional array of floats
    var key_5ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_5)
    }

    /// value_5 as multidimensional array of floats
    var value_5: MLMultiArray {
        provider.featureValue(for: "value_5")!.multiArrayValue!
    }

    /// value_5 as multidimensional array of floats
    var value_5ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_5)
    }

    /// key_9 as multidimensional array of floats
    var key_9: MLMultiArray {
        provider.featureValue(for: "key_9")!.multiArrayValue!
    }

    /// key_9 as multidimensional array of floats
    var key_9ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_9)
    }

    /// value_9 as multidimensional array of floats
    var value_9: MLMultiArray {
        provider.featureValue(for: "value_9")!.multiArrayValue!
    }

    /// value_9 as multidimensional array of floats
    var value_9ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_9)
    }

    /// key_13 as multidimensional array of floats
    var key_13: MLMultiArray {
        provider.featureValue(for: "key_13")!.multiArrayValue!
    }

    /// key_13 as multidimensional array of floats
    var key_13ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_13)
    }

    /// value_13 as multidimensional array of floats
    var value_13: MLMultiArray {
        provider.featureValue(for: "value_13")!.multiArrayValue!
    }

    /// value_13 as multidimensional array of floats
    var value_13ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_13)
    }

    /// key_17 as multidimensional array of floats
    var key_17: MLMultiArray {
        provider.featureValue(for: "key_17")!.multiArrayValue!
    }

    /// key_17 as multidimensional array of floats
    var key_17ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_17)
    }

    /// value_17 as multidimensional array of floats
    var value_17: MLMultiArray {
        provider.featureValue(for: "value_17")!.multiArrayValue!
    }

    /// value_17 as multidimensional array of floats
    var value_17ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_17)
    }

    /// key_21 as multidimensional array of floats
    var key_21: MLMultiArray {
        provider.featureValue(for: "key_21")!.multiArrayValue!
    }

    /// key_21 as multidimensional array of floats
    var key_21ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_21)
    }

    /// value_21 as multidimensional array of floats
    var value_21: MLMultiArray {
        provider.featureValue(for: "value_21")!.multiArrayValue!
    }

    /// value_21 as multidimensional array of floats
    var value_21ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_21)
    }

    /// key_25 as multidimensional array of floats
    var key_25: MLMultiArray {
        provider.featureValue(for: "key_25")!.multiArrayValue!
    }

    /// key_25 as multidimensional array of floats
    var key_25ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_25)
    }

    /// value_25 as multidimensional array of floats
    var value_25: MLMultiArray {
        provider.featureValue(for: "value_25")!.multiArrayValue!
    }

    /// value_25 as multidimensional array of floats
    var value_25ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_25)
    }

    /// key_29 as multidimensional array of floats
    var key_29: MLMultiArray {
        provider.featureValue(for: "key_29")!.multiArrayValue!
    }

    /// key_29 as multidimensional array of floats
    var key_29ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(key_29)
    }

    /// value_29 as multidimensional array of floats
    var value_29: MLMultiArray {
        provider.featureValue(for: "value_29")!.multiArrayValue!
    }

    /// value_29 as multidimensional array of floats
    var value_29ShapedArray: MLShapedArray<Float> {
        MLShapedArray<Float>(value_29)
    }

    var featureNames: Set<String> {
        provider.featureNames
    }

    func featureValue(for featureName: String) -> MLFeatureValue? {
        provider.featureValue(for: featureName)
    }

    init(var_1014: MLMultiArray, key_1: MLMultiArray, value_1: MLMultiArray, key_5: MLMultiArray, value_5: MLMultiArray, key_9: MLMultiArray, value_9: MLMultiArray, key_13: MLMultiArray, value_13: MLMultiArray, key_17: MLMultiArray, value_17: MLMultiArray, key_21: MLMultiArray, value_21: MLMultiArray, key_25: MLMultiArray, value_25: MLMultiArray, key_29: MLMultiArray, value_29: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["var_1014" : MLFeatureValue(multiArray: var_1014), "key_1" : MLFeatureValue(multiArray: key_1), "value_1" : MLFeatureValue(multiArray: value_1), "key_5" : MLFeatureValue(multiArray: key_5), "value_5" : MLFeatureValue(multiArray: value_5), "key_9" : MLFeatureValue(multiArray: key_9), "value_9" : MLFeatureValue(multiArray: value_9), "key_13" : MLFeatureValue(multiArray: key_13), "value_13" : MLFeatureValue(multiArray: value_13), "key_17" : MLFeatureValue(multiArray: key_17), "value_17" : MLFeatureValue(multiArray: value_17), "key_21" : MLFeatureValue(multiArray: key_21), "value_21" : MLFeatureValue(multiArray: value_21), "key_25" : MLFeatureValue(multiArray: key_25), "value_25" : MLFeatureValue(multiArray: value_25), "key_29" : MLFeatureValue(multiArray: key_29), "value_29" : MLFeatureValue(multiArray: value_29)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, visionOS 1.0, *)
class mygpt2 {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "media/mygpt2", withExtension:"mlmodelc")!
    }

    /**
        Construct mygpt2 instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of mygpt2.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `mygpt2.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(configuration: MLModelConfiguration = MLModelConfiguration()) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct mygpt2 instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct mygpt2 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<mygpt2, Error>) -> Void) {
        load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct mygpt2 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> mygpt2 {
        try await load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct mygpt2 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<mygpt2, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(mygpt2(model: model)))
            }
        }
    }

    /**
        Construct mygpt2 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> mygpt2 {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return mygpt2(model: model)
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as mygpt2Input

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as mygpt2Output
    */
    func prediction(input: mygpt2Input) throws -> mygpt2Output {
        try prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as mygpt2Input
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as mygpt2Output
    */
    func prediction(input: mygpt2Input, options: MLPredictionOptions) throws -> mygpt2Output {
        let outFeatures = try model.prediction(from: input, options: options)
        return mygpt2Output(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - input: the input to the prediction as mygpt2Input
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as mygpt2Output
    */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
    func prediction(input: mygpt2Input, options: MLPredictionOptions = MLPredictionOptions()) async throws -> mygpt2Output {
        let outFeatures = try await model.prediction(from: input, options: options)
        return mygpt2Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - context: 1 element vector of 32-bit integers

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as mygpt2Output
    */
    func prediction(context: MLMultiArray) throws -> mygpt2Output {
        let input_ = mygpt2Input(context: context)
        return try prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        It uses the default function if the model has multiple functions.

        - parameters:
            - context: 1 element vector of 32-bit integers

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as mygpt2Output
    */

    func prediction(context: MLShapedArray<Int32>) throws -> mygpt2Output {
        let input_ = mygpt2Input(context: context)
        return try prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        It uses the default function if the model has multiple functions.

        - parameters:
           - inputs: the inputs to the prediction as [mygpt2Input]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [mygpt2Output]
    */
    func predictions(inputs: [mygpt2Input], options: MLPredictionOptions = MLPredictionOptions()) throws -> [mygpt2Output] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [mygpt2Output] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  mygpt2Output(features: outProvider)
            results.append(result)
        }
        return results
    }
}

