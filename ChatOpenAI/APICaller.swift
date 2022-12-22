import OpenAISwift
import Foundation

final class APICaller {
  static let shared = APICaller()
  
  //what does frozen?
  @frozen enum Constants {
    static let key = "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"
  }
  
  private var client: OpenAISwift?
  
  private init() {}
  
  public func setup() {
    client = OpenAISwift(authToken: Constants.key)
  }
  
  //what does escaping?
  public func getResponse(input: String, completion: @escaping (Result<String, Error>) -> Void) {
    client?.sendCompletion(with: input, maxTokens: Int(UInt8.max), completionHandler: { result in
      switch result {
      case .success(let model):
        let output = model.choices.first?.text ?? ""
        completion(.success(output))
      case .failure(let error):
        completion(.failure(error))
      }
    })
  }
}
