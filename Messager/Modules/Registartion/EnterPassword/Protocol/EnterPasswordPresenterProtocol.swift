//
//  EnterPasswordPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

protocol EnterPasswordPresenterProtocol: AnyObject {
    var completionHandler: (() -> Void)? { get set }
    func validatePasswordsAndNavigate(passwords: (String, String))
}
