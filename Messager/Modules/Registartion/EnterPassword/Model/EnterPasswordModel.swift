//
//  EnterPasswordModel.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterPasswordModel: EnterPasswordModelProtocol {
    weak var presenter: EnterPasswordPresenterProtocol?
    
    func validatePassword(password: String) -> Bool {
        return password.isValidPassword()
    }
    
    func passwordsMatch(passwords: (String, String)) -> Bool {
        guard passwords.0 == passwords.1 else {
            return false
        }
        return true
    }
    
    deinit {
        print("deinit EnterPasswordModel")
    }
}
