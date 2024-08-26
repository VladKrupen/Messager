//
//  ViewBuilder.swift
//  Messager
//
//  Created by Vlad on 19.08.24.
//

import UIKit

final class ViewBuilder {
    
    func getBackgroundImageView(image: String, view: UIView) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        return imageView
    }
    
    func getScrollView(view: UIView) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        return scrollView
    }
    
    func getTitleLabel(title: String, view: UIView, scrollView: UIScrollView?) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = title
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        
        if let scrollView = scrollView {
            scrollView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: scrollView.topAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            ])
        } else {
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            ])
        }
        
        return label
    }
    
    func getAuthButton(title: String, size: CGFloat, color: UIColor?, target: Any, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .bold)
        button.setTitleColor(color, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
    
    func getTextField(placeholder: String, delegate: UITextFieldDelegate?, isSecureTextEntry: Bool = false, target: Any? = nil, action: Selector? = nil) -> UITextField {
        let textField = createTextField(placeholder: placeholder, delegate: delegate)
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        
        if isSecureTextEntry {
            let rightView = getRightViewForSecureTextField(target: target, action: action)
            
            textField.rightView = rightView
            textField.rightViewMode = .always
            
            textField.isSecureTextEntry = isSecureTextEntry
        } else {
            textField.rightView = padding
            textField.rightViewMode = .always
        }
        return textField
    }
    
    private func createTextField(placeholder: String, delegate: UITextFieldDelegate?) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: AppColor.textFieldColor) ?? .white])
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(hex: AppColor.textFieldColor)?.cgColor
        textField.textColor = .white
        textField.delegate = delegate
        return textField
    }
    
    private func getRightViewForSecureTextField(target: Any?, action: Selector?) -> UIView {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let imageView = UIImageView(frame: CGRect(x: 12.5, y: 12.5, width: 25, height: 25))
        imageView.image = UIImage(systemName: "eyes")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        rightView.addSubview(imageView)
        
        let longPressGesture = UILongPressGestureRecognizer(target: target, action: action)
        longPressGesture.minimumPressDuration = 0.1
        rightView.addGestureRecognizer(longPressGesture)
        return rightView
    }
    
    deinit {
        print("deinit builder")
    }
}

