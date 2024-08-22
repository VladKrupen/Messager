//
//  EnterPasswordView.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import UIKit

final class EnterPasswordView: UIView {
    
    var nextButtonAction: (((String, String)) -> Void)?
    
    private let viewBuilder = ViewBuilder()
    
    //MARK: UI
    private lazy var backgroundImageView = viewBuilder.getBackgroundImageView(image: AppImage.imageBackgroundRegistrationScreen, view: self)
    
    private lazy var scrollView = viewBuilder.getScrollView(view: self)
    
    private lazy var titleLabel = viewBuilder.getTitleLabel(title: "Придумайте пароль", view: self, scrollView: scrollView)
    
    private lazy var firstPasswordField = viewBuilder.getTextField(placeholder: "Введите", delegate: self, isSecureTextEntry: true, target: self, action: #selector(viewFirstPasswordFieldLongPress))
    
    private lazy var secondPasswordField = viewBuilder.getTextField(placeholder: "Повторите", delegate: self, isSecureTextEntry: true, target: self, action: #selector(viewSecondPasswordFieldLongPress))
    
    private let vStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 25
        return $0
    }(UIStackView())
    
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
    
    //MARK: Configure
    func clearTextFields() {
        firstPasswordField.text = ""
        secondPasswordField.text = ""
    }
    
    //MARK: Setup
    private func setupHidingKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tapGesture)
    }
    
    private func toggleSecureEntry(textField: UITextField, gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            textField.isSecureTextEntry = false
        } else {
            textField.isSecureTextEntry = true
        }
    }
    
    //MARK: Layout
    private func layoutElements() {
        sendSubviewToBack(backgroundImageView)
        bringSubviewToFront(titleLabel)
        layoutVStack()
        layoutNextButton()
    }
    
    private func layoutVStack() {
        scrollView.addSubview(vStack)
        vStack.addArrangedSubview(firstPasswordField)
        vStack.addArrangedSubview(secondPasswordField)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        ])
    }
    
    private func layoutNextButton() {
        scrollView.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 50)
        ])
    }
    
    deinit {
        print("deinit EnterPasswordView")
    }
}

//MARK: OBJC
extension EnterPasswordView {
    @objc private func nextButtonTapped() {
        guard let firstPassword = firstPasswordField.text, let secondPassword = secondPasswordField.text else {
            return
        }
        nextButtonAction?((firstPassword, secondPassword))
        endEditing(true)
    }
    
    @objc private func viewFirstPasswordFieldLongPress(_ gesture: UILongPressGestureRecognizer) {
        toggleSecureEntry(textField: firstPasswordField, gesture: gesture)
    }
    
    @objc private func viewSecondPasswordFieldLongPress(_ gesture: UILongPressGestureRecognizer) {
        toggleSecureEntry(textField: secondPasswordField, gesture: gesture)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
}

//MARK: UITextFieldDelegate
extension EnterPasswordView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstPasswordField:
            secondPasswordField.becomeFirstResponder()
        case secondPasswordField:
            textField.resignFirstResponder()
        default:
            return true
        }
        return true
    }
}
