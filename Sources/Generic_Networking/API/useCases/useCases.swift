//
//  useCases.swift
//  Networking
//
//  Created by yousef Elaidy on 27/03/2024.
//

protocol UseCase {
    associatedtype T
    
    func fetchData(completion: @escaping (Result<T, NetworkError>) -> Void)
    func sendData(_ item: T, completion: @escaping (Result<T, NetworkError>) -> Void)
    func updateData(_ item: T, completion: @escaping (Result<T, NetworkError>) -> Void)
    func deleteData(_ item: T, completion: @escaping (Result<Void, NetworkError>) -> Void)
}
