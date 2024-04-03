
import Foundation
public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum urlScheme: String{
    case https = "https"
    case http = "http"
}
public protocol NetworkManager {
    func request<T: APIRequest>(_ request: T, completion: @escaping (Result<T.Response, NetworkError>) -> Void)
}


public class DefaultNetworkManager: NetworkManager {
    let internetManager: InternetManager
    
   public init(internetManager: InternetManager) {
        self.internetManager = internetManager
    }
    
    public func request<T: APIRequest>(_ request: T, completion: @escaping (Result<T.Response, NetworkError>) -> Void) {
        guard internetManager.isConnected() else {
            completion(.failure(.noInternetConnection))
            return
        }
        
        guard let urlRequest = APIRequestProvider.makeRequest(request) else {
            completion(.failure(.badRequest))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error{
                completion(.failure(.otherError(error)))
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                           completion(.failure(.decodingError))
                           return
                       }
            switch httpResponse.statusCode {
                      case 200..<300:
                          if let data = data {
                              do {
                                                let decodedData = try JSONDecoder().decode(T.Response.self, from: data)
                                  completion(.success(decodedData))
                              } catch {
                                  completion(.failure(.decodingError))
                              }
                          } else {
                              completion(.failure(.decodingError))
                          }
                      case 400:
                          completion(.failure(.badRequest))
                      case 401:
                          completion(.failure(.unauthorized))
                      case 404:
                          completion(.failure(.notFound))
                      case 500..<600:
                          completion(.failure(.serverError))
                      default:
                          completion(.failure(.otherError(NetworkError.decodingError)))
                      }
        }.resume()
    }
}
