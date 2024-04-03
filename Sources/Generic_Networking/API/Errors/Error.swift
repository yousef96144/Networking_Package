//
//  Error.swift
//  Networking
//
//  Created by yousef Elaidy on 27/03/2024.
//

public enum NetworkError: Error {
    case noInternetConnection
    case unauthorized
    case badRequest
    case notFound
    case serverError
    case decodingError
    case otherError(Error)
}
