//
//  EnterEmailPresenter.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterEmailPresenter: EnterEmailPresenterProtocol {
    
    weak var view: EnterEmailViewProtocol?
    let model: EnterEmailModelProtocol
    
    init(view: EnterEmailViewProtocol? = nil, model: EnterEmailModelProtocol) {
        self.view = view
        self.model = model
    }
    
    deinit {
        print("deinit EnterEmailPresenter")
    }
}
