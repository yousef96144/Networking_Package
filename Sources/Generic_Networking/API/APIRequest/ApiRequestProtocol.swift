//
//  ApiRequestProtocol.swift
//  Networking
//
//  Created by yousef Elaidy on 27/03/2024.
//

import Foundation
public protocol APIRequest {
    associatedtype Response: Decodable
    
    var scheme: urlScheme { get}
    var host: String { get }
    var path: String {get}
    var queryItem: URLQueryItem? {get}
    var method: RequestMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
}
