//
//  AuthCoordinator.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

final class AuthCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showAuthModule()
    }
    
    private func showAuthModule() {
        let controller = ModuleFactory().createAuthModule()
        navigationController.setViewControllers([controller], animated: false)
        controller.presenter.completionHandler = { [weak self] button in
            switch button {
            case .loginButton:
                self?.showLoginModule()
            case .registrationButton:
                self?.showEnterEmailModule()
            }
        }
    }
    
    private func showLoginModule() {
        let controller = ModuleFactory().createLoginModule()
        navigationController.pushViewController(controller, animated: true)
        //completionHandler
    }
    
    private func showEnterEmailModule() {
        let controller = ModuleFactory().createEnterEmailModule()
        navigationController.pushViewController(controller, animated: true)
        //completionHandler
    }
}
