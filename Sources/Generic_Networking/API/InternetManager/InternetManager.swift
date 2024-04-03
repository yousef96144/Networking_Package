//
//  InternetManager.swift
//  Networking
//
//  Created by yousef Elaidy on 27/03/2024.
//

public protocol InternetManager {
    func isConnected() -> Bool
}

 open class DefaultInternetManager: InternetManager {
    public init(){}
   public func isConnected() -> Bool {
        // Implementation to check internet connectivity
        return true // Placeholder implementation
    }
}

