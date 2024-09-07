//
//  ChatsCoordinator.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import UIKit

final class ChatsCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showChatsModule()
    }
    
    private func showChatsModule() {
        let controller = ModuleFactory().createChatsModule()
        navigationController.pushViewController(controller, animated: true)
        controller.presenter.completionHandler = { [weak self] in
            
        }
    }
}
