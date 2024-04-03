


import Foundation

protocol Repository {
    associatedtype T
    
    func get(completion: @escaping (Result<T, NetworkError>) -> Void)
    func post(_ item: T, completion: @escaping (Result<T, NetworkError>) -> Void)
    func put(_ item: T, completion: @escaping (Result<T, NetworkError>) -> Void)
    func delete(_ item: T, completion: @escaping (Result<Void, NetworkError>) -> Void)
}
