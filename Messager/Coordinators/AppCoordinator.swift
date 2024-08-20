//
//  AppCoordinator.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    
    var navigationController: UINavigationController
    private let coordinatorFactory = CoordinatorFactory()
    
    private var childCoordinator: [CoordinatorProtocol] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSplash()
    }
    
    private func showSplash() {
        let splashCoordinator = coordinatorFactory.createSplashCoordinator(navigationController: navigationController)
        childCoordinator.append(splashCoordinator)
        splashCoordinator.start()
        splashCoordinator.flowCompletionHandler = { [weak self] in
            self?.showAuth()
        }
    }
    
    private func showAuth() {
        let authCoordinator = coordinatorFactory.createAuthCoordinator(navigationController: navigationController)
        childCoordinator.append(authCoordinator)
        authCoordinator.start()
        authCoordinator.flowCompletionHandler = { [weak self] in
            
        }
    }
}
