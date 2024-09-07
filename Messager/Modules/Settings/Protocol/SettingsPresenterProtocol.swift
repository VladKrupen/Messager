//
//  SettingsPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    var completionHandler: (() -> Void)? { get set }
}
