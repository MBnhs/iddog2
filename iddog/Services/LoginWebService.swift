//
//  LoginWebService.swift
//  iddog
//
//  Created by Marcelo Banhos on 16/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import Foundation

class LoginWebservice {
    
//    func load(resource: Resource<User?>, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
//        
//        var request = URLRequest(url: resource.url)
//        request.httpMethod = resource.httpMethod.rawValue
//        request.httpBody = resource.body
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            
//            guard let data = data, error == nil else {
//                completion(.failure(.domainError))
//                return
//            }
//            
//            let result = try? JSONDecoder().decode(LoginResponse.self, from: data)
//            
//            if let result = result {
//                DispatchQueue.main.async {
//                    completion(.success(result))
//                }
//            } else {
//                completion(.failure(.decodingError))
//            }
//            
//            }.resume()
//        
//    }
    
}
