//
//  UserInfoPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 23.08.24.
//

import Foundation

protocol UserInfoPresenterProtocol: AnyObject {
    var completionHandler: (() -> Void)? { get set }
}
