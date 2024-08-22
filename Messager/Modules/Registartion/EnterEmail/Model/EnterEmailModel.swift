//
//  EnterEmailModel.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterEmailModel: EnterEmailModelProtocol {
    weak var presenter: EnterEmailPresenterProtocol?
    
    deinit {
        print("deinit EnterEmailModel")
    }
    
    func valideEmail(email: String) -> Bool {
        return email.isValidEmail()
    }
}
