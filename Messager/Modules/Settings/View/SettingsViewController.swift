//
//  SettingsViewController.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SettingsViewController: SettingsViewProtocol {
    
}
