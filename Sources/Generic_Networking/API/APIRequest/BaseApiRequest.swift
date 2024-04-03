//
//  BaseApiRequest.swift
//  Networking
//
//  Created by yousef Elaidy on 27/03/2024.
//

import Foundation


extension APIRequest{
   
    var method: String {
          return "GET"
      }
      
      var parameters: [String: Any]? {
          return nil
      }
      
      var headers: [String: String]? {
          return nil
      }
    
    var queryItem: [URLQueryItem]?{
        return nil
    }
    
    var schema: String {
        return urlScheme.https.rawValue
    }
    
   

}
