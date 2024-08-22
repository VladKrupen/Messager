//
//  EnterEmailPresenter.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterEmailPresenter: EnterEmailPresenterProtocol {
    var completionHandler: (() -> Void)?
    
    weak var view: EnterEmailViewProtocol?
    let model: EnterEmailModelProtocol
    
    init(view: EnterEmailViewProtocol? = nil, model: EnterEmailModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func validateEmailAndNavigate(email: String) {
        guard model.valideEmail(email: email) else {
            view?.showAlertIncorrectEmail()
            return
        }
        navigateToNextScreen()
    }
    
    private func navigateToNextScreen() {
        completionHandler?()
    }
    
    deinit {
        print("deinit EnterEmailPresenter")
    }
}
