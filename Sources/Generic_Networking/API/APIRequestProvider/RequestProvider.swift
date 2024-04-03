
import Foundation


struct APIRequestProvider {
    static func makeRequest<T: APIRequest>(_ request: T) -> URLRequest? {
       var urlComponent = URLComponents()
        urlComponent.scheme = request.scheme.rawValue
        urlComponent.host = request.host
        urlComponent.path = request.path
        print("host = \(urlComponent.path)")
//        urlComponent.queryItems = request.queryItem
 //       print(urlComponent.url ?? "no url" )
        
        guard let url = urlComponent.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        print(urlRequest.httpBody ?? "no body data")
        request.headers?.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
