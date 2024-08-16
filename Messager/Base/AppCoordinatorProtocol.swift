//
//  AppCoordinatorProtocol.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}
