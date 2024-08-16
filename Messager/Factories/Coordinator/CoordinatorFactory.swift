//
//  CoordinatorFactory.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

final class CoordinatorFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        return appCoordinator
    }
    
    func createSplashCoordinator(navigationController: UINavigationController) -> SplashCoordinator {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        return splashCoordinator
    }
}
