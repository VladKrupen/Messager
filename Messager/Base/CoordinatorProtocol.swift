//
//  CoordinatorProtocol.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: (() -> Void)? { get set }
    
    func start()
}
