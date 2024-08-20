//
//  AuthViewController.swift
//  Messager
//
//  Created by Vlad on 18.08.24.
//

import UIKit

final class AuthViewController: UIViewController, AuthViewProtocol {
    
    var presenter: AuthPresenterProtocol!
    private let authView = AuthView()
    
    override func loadView() {
        super.loadView()
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonTapped()
        registartionButtonTapped()
    }
    
    private func loginButtonTapped() {
        authView.loginButtonAction = { [weak self] in
            self?.presenter.navigateToNextScreen(button: .loginButton)
        }
    }
    
    private func registartionButtonTapped() {
        authView.registrationButtonAction = { [weak self] in
            self?.presenter.navigateToNextScreen(button: .registrationButton)
        }
    }
    
    deinit {
        print("deinit AuthVC")
    }
}
