//
//  LoginPresenter.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    let model: LoginModelProtocol
    
    init(view: LoginViewProtocol? = nil, model: LoginModelProtocol) {
        self.view = view
        self.model = model
    }
    
    deinit {
        print("deinit LoginPresenter")
    }
}
