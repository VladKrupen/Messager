//
//  UserInfoPresenter.swift
//  Messager
//
//  Created by Vlad on 23.08.24.
//

import Foundation

final class UserInfoPresenter: UserInfoPresenterProtocol {
    
    weak var view: UserInfoViewController?
    let model: UserInfoModelProtocol
    
    init(view: UserInfoViewController? = nil, model: UserInfoModelProtocol) {
        self.view = view
        self.model = model
    }
    
    deinit {
        print("deinit UserInfoPresenter")
    }
}
