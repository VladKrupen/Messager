//
//  EnterPasswordViewController.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import UIKit

final class EnterPasswordViewController: UIViewController, EnterPasswordViewProtocol {
    
    var presenter: EnterPasswordPresenterProtocol!
    private let enterPasswordView = EnterPasswordView()
    
    override func loadView() {
        super.loadView()
        view = enterPasswordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonTapped()
    }
    
    func showAlertIncorrectPassword() {
        let alertController = UIAlertController(title: "Некорректный пароль", message: "Пароль должен содержать не менее 8 символов, хотя бы одну букву, хотя бы одну цифру, и может содержать символы - и _", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default) { [weak self] _ in
            self?.clearTextFields()
        }
        alertController.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true)
        }
    }
    
    func showAlertPasswordsDoNotMatch() {
        let alertController = UIAlertController(title: "Пароли не совпадают", message: "Пароли не соответствуют друг другу. Пожалуйста, проверьте введенные данные.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default) 
        alertController.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true)
        }
    }
    
    private func nextButtonTapped() {
        enterPasswordView.nextButtonAction = { [weak self] passwords in
            self?.presenter.validatePasswordsAndNavigate(passwords: passwords)
        }
    }
    
    private func clearTextFields() {
        enterPasswordView.clearTextFields()
    }
    
    deinit {
        print("deinit EnterPasswordVC")
    }
}
