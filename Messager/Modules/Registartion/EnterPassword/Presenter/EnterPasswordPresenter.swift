//
//  EnterPasswordPresenter.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterPasswordPresenter: EnterPasswordPresenterProtocol {
    
    weak var view: EnterPasswordViewProtocol?
    let model: EnterPasswordModelProtocol
    
    init(view: EnterPasswordViewProtocol? = nil, model: EnterPasswordModelProtocol) {
        self.view = view
        self.model = model
    }
    
    deinit {
        print("deinit EnterPasswordPresenter")
    }
}
