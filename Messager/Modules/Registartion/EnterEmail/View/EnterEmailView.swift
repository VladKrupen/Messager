//
//  EnterEmailView.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import UIKit

final class EnterEmailView: UIView {
    
    var nextButtonAction: ((String) -> Void)?
    
    private let viewBuilder = ViewBuilder()
    
    //MARK: UI
    private lazy var backgroundImageView = viewBuilder.getBackgroundImageView(image: AppImage.imageBackgroundRegistrationScreen, view: self)
    
    private lazy var scrollView = viewBuilder.getScrollView(view: self)
    
    private lazy var titleLabel = viewBuilder.getTitleLabel(title: "Введите email", view: self, scrollView: scrollView)
    
    private lazy var emailField = viewBuilder.getTextField(placeholder: "Email", delegate: self)
    
    private lazy var nextButton = viewBuilder.getAuthButton(title: "Далее", size: 24, color: .white, target: self, action: #selector(nextButtonTapped))
    
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
    
    //MARK: Layout
    private func layoutElements() {
        sendSubviewToBack(backgroundImageView)
        bringSubviewToFront(titleLabel)
        layoutEmailField()
        layoutNextButton()
    }
    
    private func layoutEmailField() {
        scrollView.addSubview(emailField)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func layoutNextButton() {
        scrollView.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 50)
        ])
    }
    
    deinit {
        print("deinit EnterEmailView")
    }
}

//MARK: OBJC
extension EnterEmailView {
    @objc private func nextButtonTapped() {
        guard let email = emailField.text else {
            return
        }
        nextButtonAction?(email)
        endEditing(true)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
}

//MARK: UITextFieldDelegate
extension EnterEmailView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.autocapitalizationType = .none
    }
}
