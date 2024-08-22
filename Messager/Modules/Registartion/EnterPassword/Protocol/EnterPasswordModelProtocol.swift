//
//  EnterPasswordModelProtocol.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

protocol EnterPasswordModelProtocol: AnyObject {
    func validatePassword(password: String) -> Bool
    func passwordsMatch(passwords: (String, String)) -> Bool
}
