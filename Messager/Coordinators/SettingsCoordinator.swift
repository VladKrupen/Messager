//
//  SettingsCoordinator.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import UIKit

final class SettingsCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSettingsModule()
    }
    
    private func showSettingsModule() {
        let settingsController = ModuleFactory().createSettingsModule()
        navigationController.pushViewController(settingsController, animated: true)
        settingsController.presenter.completionHandler = { [weak self] in
            
        }
    }
}
