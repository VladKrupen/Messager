//
//  UserInfoView.swift
//  Messager
//
//  Created by Vlad on 23.08.24.
//

import UIKit

final class UserInfoView: UIView {
    
    var nextButtonAction: ((String, String) -> Void)?
    var imageViewAction: (() -> Void)?
    
    private let viewBuilder = ViewBuilder()
    
    //MARK: UI
    private lazy var backgroundImageView = viewBuilder.getBackgroundImageView(image: AppImage.imageBackgroundRegistrationScreen, view: self)
    
    private lazy var scrollView = viewBuilder.getScrollView(view: self)
    
    private lazy var titleLabel = viewBuilder.getTitleLabel(title: "Введите данные", view: self, scrollView: scrollView)
    
    private lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.layer.cornerRadius = 100
        $0.layer.borderWidth = 5
        $0.layer.borderColor = UIColor.white.cgColor
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = UIImage(systemName: "person")
        $0.tintColor = .white
        $0.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        $0.addGestureRecognizer(tapGesture)
        
        return $0
    }(UIImageView())
    
    private lazy var firstNameField = viewBuilder.getTextField(placeholder: "Имя", delegate: self)
    
    private lazy var lastNameField = viewBuilder.getTextField(placeholder: "Фамилия", delegate: self)
    
    private lazy var nextButton = viewBuilder.getAuthButton(title: "Далее", size: 24, color: .white, target: self, action: #selector(nextButtonTapped))
    
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
        scrollingWhenOpeningKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    private func setupHidingKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tapGesture)
    }
    
    private func scrollingWhenOpeningKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: Layout
    private func layoutElements() {
        sendSubviewToBack(backgroundImageView)
        bringSubviewToFront(titleLabel)
        layoutImageView()
        layoutVStack()
        layoutNextButton()
    }
    
    private func layoutImageView() {
        scrollView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
        ])
    }
    
    private func layoutVStack() {
        scrollView.addSubview(vStack)
        vStack.addArrangedSubview(firstNameField)
        vStack.addArrangedSubview(lastNameField)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
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
        print("deinit UserInfoView")
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: OBJC
extension UserInfoView {
    @objc private func nextButtonTapped() {
        guard let firstName = firstNameField.text, let lastName = lastNameField.text else {
            return
        }
        nextButtonAction?(firstName, lastName)
        endEditing(true)
    }
    
    @objc private func imageViewTapped() {
        imageViewAction?()
        endEditing(true)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            scrollView.contentInset = contentInset
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
}

//MARK: UITextFieldDelegate
extension UserInfoView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameField:
            lastNameField.becomeFirstResponder()
        case lastNameField:
            textField.resignFirstResponder()
        default:
            return true
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let contentOffset = CGPoint(x: 0, y: textField.frame.origin.y - scrollView.contentInset.top + 100)
        scrollView.setContentOffset(contentOffset, animated: true)
    }
}
