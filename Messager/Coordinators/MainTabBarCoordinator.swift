//
//  MainTabBarCoordinator.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import UIKit

final class MainTabBarCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    private var childCoordinator: [CoordinatorProtocol] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainTabBar()
    }
    
    private func showMainTabBar() {
        let tabBarController = UITabBarController()
        let chatsNavigationController = createNavigationController(itemName: "Chats", itemImage: "message.fill")
        let settingsNavigationController = createNavigationController(itemName: "Settings", itemImage: "gearshape")
        showChats(navigationController: chatsNavigationController)
        showSettings(navigationController: settingsNavigationController)
        tabBarController.viewControllers = [chatsNavigationController, settingsNavigationController]
        navigationController.setViewControllers([tabBarController], animated: true)
        navigationController.navigationBar.isHidden = true
    }
    
    private func createNavigationController(itemName: String, itemImage: String) -> UINavigationController {
        let tabBarItem = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        let navigationController = UINavigationController()
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
    
    private func showChats(navigationController: UINavigationController) {
        let chatsCoordinator = CoordinatorFactory().createChatsCoordinator(navigationController: navigationController)
        childCoordinator.append(chatsCoordinator)
        chatsCoordinator.start()
    }
    
    private func showSettings(navigationController: UINavigationController) {
        let settingsCoordinator = CoordinatorFactory().createSettingsCoordinator(navigationController: navigationController)
        childCoordinator.append(settingsCoordinator)
        settingsCoordinator.start()
    }
}
