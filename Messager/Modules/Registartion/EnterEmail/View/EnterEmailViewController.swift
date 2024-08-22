//
//  EnterEmailViewController.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import UIKit

final class EnterEmailViewController: UIViewController, EnterEmailViewProtocol {
    
    var presenter: EnterEmailPresenterProtocol!
    private let enterEmailView = EnterEmailView()
    
    override func loadView() {
        super.loadView()
        view = enterEmailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonTapped()
    }
    
    private func nextButtonTapped() {
        enterEmailView.nextButtonAction = { [weak self] email in
            print(email)
        }
    }
    
    deinit {
        print("deinit EnterEmailVC")
    }
}
