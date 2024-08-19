//
//  AuthView.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import UIKit

class AuthView: UIView {
    
    var loginButtonAction: (() -> Void)?
    var registrationButtonAction: (() -> Void)?
    
    //MARK: UI
    private let backgroundImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "auth")
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "Messager"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var loginButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Войти", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    private lazy var registrationButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Регистрация", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        $0.setTitleColor(UIColor(hex: AppColor.registartionButtonColor), for: .normal)
        $0.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
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
        layoutElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout
    private func layoutElements() {
        layoutBackgroundImageView()
        layoutTitleLabel()
        layoutStackOfButtons()
    }
    
    private func layoutBackgroundImageView() {
        addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
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
