//
//  AuthPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 18.08.24.
//

import Foundation

protocol AuthPresenterProtocol: AnyObject {
    var completionHandler: ((AuthButton) -> Void)? { get set }
    func navigateToNextScreen(button: AuthButton)
}
