//
//  EnterPasswordViewController.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import UIKit

final class EnterPasswordViewController: UIViewController, EnterPasswordViewProtocol {
    
    var presener: EnterPasswordPresenterProtocol!
    private let enterPasswordView = EnterPasswordView()
    
    override func loadView() {
        super.loadView()
        view = enterPasswordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        print("deinit EnterPasswordVC")
    }
}
