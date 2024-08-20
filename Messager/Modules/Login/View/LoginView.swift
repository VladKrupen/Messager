//
//  LoginView.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import UIKit

final class LoginView: UIView {
    
    private let viewBuilder = ViewBuilder()
    
    //MARK: UI
    private lazy var backgroundImageView = viewBuilder.getBackgroundImageView(image: AppImage.imageBackgroundLoginScreen, view: self)
    
    private lazy var scrollView = viewBuilder.getScrollView(view: self)
    
    private lazy var titleLabel = viewBuilder.getTitleLabel(title: "Авторизация", view: self, scrollView: scrollView)
    
    private lazy var emailField = viewBuilder.getTextField(placeholder: "Email", delegate: self, isSecureTextEntry: false)
    
    private lazy var passwordField = viewBuilder.getTextField(placeholder: "Password", delegate: self, isSecureTextEntry: true, target: self, action: #selector(viewPasswordFieldLongPress))
    
    private lazy var loginButton = viewBuilder.getAuthButton(title: "Войти", size: 24, color: .white, target: self, action: #selector(loginButtonTapped))
    
    private let vStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 25
        return $0
    }(UIStackView())
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutElements()
        setupHidingKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup keyboard

    private func setupHidingKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tapGesture)
    }
    
    //MARK: Layout elements
    private func layoutElements() {
        sendSubviewToBack(backgroundImageView)
        bringSubviewToFront(titleLabel)
        layoutVStack()
        layoutLoginButton()
    }
    
    private func layoutVStack() {
        scrollView.addSubview(vStack)
        vStack.addArrangedSubview(emailField)
        vStack.addArrangedSubview(passwordField)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        ])
    }
    
    private func layoutLoginButton() {
        scrollView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50)
        ])
    }

    deinit {
        print("deinit LoginView")
    }
}

//MARK: OBJC
extension LoginView {
    @objc private func loginButtonTapped() {
        print(emailField.text)
        print(passwordField.text)
    }
    
    @objc private func viewPasswordFieldLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.isSecureTextEntry = true
        }
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
}

//MARK: UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
