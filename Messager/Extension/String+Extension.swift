//
//  String+Extension.swift
//  Messager
//
//  Created by Vlad on 22.08.24.
//

import Foundation

extension String {
    
    //MARK: Email validation
    struct EmailValidation {
        private static let emailRegax = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        static let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegax)
    }
    
    func isValidEmail() -> Bool {
        return EmailValidation.emailPredicate.evaluate(with: self)
    }
    
    //MARK: Password validation
    struct PasswordValidation {
        private static let passwordRegax = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d_-]{8,}$"
        static let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegax)
    }
    
    func isValidPassword() -> Bool {
        return PasswordValidation.passwordPredicate.evaluate(with: self)
    }
}
