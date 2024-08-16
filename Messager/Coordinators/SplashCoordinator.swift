//
//  SplashCoordinator.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

final class SplashCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: (() -> Void)?
    private let moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSplashModule()
    }
    
    private func showSplashModule() {
        let controller = moduleFactory.createSplashModule()
        navigationController.pushViewController(controller, animated: true)
        controller.presenter.completionHendler = { [weak self] value in
            print("Go to login")
        }
    }
}
