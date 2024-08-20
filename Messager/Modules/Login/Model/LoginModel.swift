//
//  LoginModel.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import Foundation

final class LoginModel: LoginModelProtocol {
    weak var presenter: LoginPresenterProtocol?
    
    deinit {
        print("deinit LoginModel")
    }
}
