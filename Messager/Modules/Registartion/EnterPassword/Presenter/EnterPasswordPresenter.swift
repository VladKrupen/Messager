//
//  EnterPasswordPresenter.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterPasswordPresenter: EnterPasswordPresenterProtocol {
    
    var completionHandler: (() -> Void)?
    
    weak var view: EnterPasswordViewProtocol?
    let model: EnterPasswordModelProtocol
    
    init(view: EnterPasswordViewProtocol? = nil, model: EnterPasswordModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func validatePasswordsAndNavigate(passwords: (String, String)) {
        guard model.validatePassword(password: passwords.0) && model.passwordsMatch(passwords: passwords) else {
            checkPasswordCorrectness(password: passwords.0)
            checkPasswordsMatch(passwords: passwords)
            return
        }
        navigateToNextScreen()
    }
    
    private func navigateToNextScreen() {
        completionHandler?()
    }
    
    private func checkPasswordCorrectness(password: String) {
        guard !model.validatePassword(password: password) else {
            return
        }
        view?.showAlertIncorrectPassword()
    }
    
    private func checkPasswordsMatch(passwords: (String, String)) {
        guard !model.passwordsMatch(passwords: passwords) else {
            return
        }
        view?.showAlertPasswordsDoNotMatch()
    }
    
    deinit {
        print("deinit EnterPasswordPresenter")
    }
}
