//
//  User.swift
//  iddog
//
//  Created by Marcelo Banhos on 16/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import Foundation

struct Usuario: Codable {
    
    let email: String?
    let token: String?
    let user: LoginResponse?

}

extension Usuario {
    
    static func create(vm: LoginViewModel) -> Resource<Usuario?> {
        
        let user = Usuario(vm)
        
        
        
        guard let url = URL(string: "https://api-iddog.idwall.co/signup") else {
            fatalError("URL está incorreta")
        }
        
        guard let data = try? JSONEncoder().encode(user) else {
            fatalError("Erro no encoding de usuário!")
        }
        
        var resource = Resource<Usuario?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
        
    }
    
}


extension Usuario {
    
    init?(_ loginViewModel: LoginViewModel) {
        
        guard let email = loginViewModel.email else {
            return nil
        }
        
        self.email = email
        self.token = nil
        self.user = nil
        
    }
    
}
