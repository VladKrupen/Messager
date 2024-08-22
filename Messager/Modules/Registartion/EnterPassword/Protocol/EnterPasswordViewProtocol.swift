//
//  EnterPasswordViewProtocol.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

protocol EnterPasswordViewProtocol: AnyObject {
    func showAlertIncorrectPassword()
    func showAlertPasswordsDoNotMatch()
}
