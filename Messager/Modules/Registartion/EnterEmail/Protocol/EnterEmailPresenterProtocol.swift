//
//  EnterEmailPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

protocol EnterEmailPresenterProtocol: AnyObject {
    var completionHandler: (() -> Void)? { get set }
    func validateEmailAndNavigate(email: String)
}
