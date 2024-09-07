//
//  SettingsPresenter.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import Foundation

final class SettingsPresenter: SettingsPresenterProtocol {
    var completionHandler: (() -> Void)?
    
    weak var view: SettingsViewProtocol?
    
    init(view: SettingsViewProtocol? = nil) {
        self.view = view
    }
}
