//
//  LoginViewController.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import UIKit

final class LoginViewController: UIViewController, LoginViewProtocol {
    
    var presenter: LoginPresenterProtocol!
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    deinit {
        print("deinit LoginVC")
    }
}

