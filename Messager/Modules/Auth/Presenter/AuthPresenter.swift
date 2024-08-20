//
//  AuthPresenter.swift
//  Messager
//
//  Created by Vlad on 18.08.24.
//

import Foundation

final class AuthPresenter: AuthPresenterProtocol {
    
    var completionHandler: ((AuthButton) -> Void)?
    
    weak var view: AuthViewProtocol?
    
    init(view: AuthViewProtocol? = nil) {
        self.view = view
    }
    
    func navigateToNextScreen(button: AuthButton) {
        completionHandler?(button)
    }
    
    deinit {
        print("deinit AuthPresenter")
    }
}
