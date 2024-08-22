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
    
    func showAlertIncorrectEmail() {
        let alertController = UIAlertController(title: "Некорректный адрес", message: "Адрес электронной почты указан некорректно. Пожалуйста, проверьте введенные данные.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default) { [weak self] _ in
            self?.clearTextField()
        }
        alertController.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true)
        }
    }
    
    private func nextButtonTapped() {
        enterEmailView.nextButtonAction = { [weak self] email in
            self?.presenter.validateEmailAndNavigate(email: email)
        }
    }
    
    private func clearTextField() {
        enterEmailView.clearEmailField()
    }
    
    deinit {
        print("deinit EnterEmailVC")
    }
}
