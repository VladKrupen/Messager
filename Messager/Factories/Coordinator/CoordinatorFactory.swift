//
//  CoordinatorFactory.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

final class CoordinatorFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinatorProtocol {
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        return appCoordinator
    }
    
    func createSplashCoordinator(navigationController: UINavigationController) -> CoordinatorProtocol {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        return splashCoordinator
    }
    
    func createAuthCoordinator(navigationController: UINavigationController) -> CoordinatorProtocol {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        return authCoordinator
    }
}
