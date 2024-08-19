//
//  AuthPresenter.swift
//  Messager
//
//  Created by Vlad on 18.08.24.
//

import Foundation

final class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    
    init(view: AuthViewProtocol? = nil) {
        self.view = view
    }
}
