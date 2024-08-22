//
//  EnterEmailModelProtocol.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

protocol EnterEmailModelProtocol: AnyObject {
    func valideEmail(email: String) -> Bool
}
