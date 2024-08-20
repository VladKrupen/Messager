//
//  AuthView.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import UIKit

final class AuthView: UIView {
    
    var loginButtonAction: (() -> Void)?
    var registrationButtonAction: (() -> Void)?
    
    private let viewBuilder = ViewBuilder()
    
    //MARK: UI
    private lazy var backgroundImageView = viewBuilder.getBackgroundImageView(image: AppImage.imageBackgroundAuthScreen, view: self)
    
    private lazy var titleLabel = viewBuilder.getTitleLabel(title: "Messager", view: self, scrollView: nil)
    
    private lazy var loginButton = viewBuilder.getAuthButton(title: "Войти", size: 24, color: .white, target: self, action: #selector(loginButtonTapped))
        
    private lazy var registrationButton = viewBuilder.getAuthButton(title: "Регистрация", size: 24, color: UIColor(hex: AppColor.registartionButtonColor), target: self, action: #selector(registrationButtonTapped))
    
    private let stackOfButtons: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .center
        return $0
    }(UIStackView())
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout
    private func layoutElements() {
        sendSubviewToBack(backgroundImageView)
        bringSubviewToFront(titleLabel)
        layoutStackOfButtons()
    }
    
    private func layoutStackOfButtons() {
        addSubview(stackOfButtons)
        stackOfButtons.addArrangedSubview(loginButton)
        stackOfButtons.addArrangedSubview(registrationButton)
        
        NSLayoutConstraint.activate([
            stackOfButtons.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            stackOfButtons.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    deinit {
        print("deinit AuthView")
    }
}

//MARK: OBJC
extension AuthView {
    @objc private func loginButtonTapped() {
        loginButtonAction?()
    }
    
    @objc private func registrationButtonTapped() {
        registrationButtonAction?()
    }
}
