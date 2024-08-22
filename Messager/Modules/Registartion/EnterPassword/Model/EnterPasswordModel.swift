//
//  EnterPasswordModel.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

final class EnterPasswordModel: EnterPasswordModelProtocol {
    weak var presenter: EnterPasswordPresenterProtocol?
    
    deinit {
        print("deinit EnterPasswordModel")
    }
}
