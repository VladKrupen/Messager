//
//  ChatsViewController.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import UIKit

final class ChatsViewController: UIViewController {
    
    var presenter: ChatsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ChatsViewController: ChatsViewProtocol {
    
}
