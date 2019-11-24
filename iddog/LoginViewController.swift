//
//  ViewController.swift
//  iddog
//
//  Created by Marcelo Banhos on 16/11/19.
//  Copyright © 2019 Marcelo Banhos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginVM = LoginViewModel()

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func realizaLogin(_ sender: UIButton) {
        self.loginVM.email = emailTextField.text
        
        Webservice().load(resource: Usuario.create(vm: loginVM)) { result in
            
            switch result {
            case .success(let usuario):
                
                if let token = usuario!.user?.token/*, let delegate = self.delegate*/ {
                    DispatchQueue.main.async {
                        print(token)
                        let userDefaults = UserDefaults.standard
                        userDefaults.set(token, forKey: "token")
                        self.performSegue(withIdentifier: "galeria", sender: self)

                    }
                } else {
                    DispatchQueue.main.async {
                        let userDefaults = UserDefaults.standard
                        userDefaults.set(nil, forKey: "token")
                        let alerta = UIAlertController(title: "Erro", message: "Não foi possível acessar o idDog, tente mais tarde", preferredStyle: .alert)
                        alerta.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alerta, animated: true, completion: nil)
                        
                    }
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}

