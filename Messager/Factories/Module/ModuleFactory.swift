//
//  ModuleFactory.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit

final class ModuleFactory {
    
    func createSplashModule() -> SplashViewController {
        let view = SplashViewController()
        let presenter = SplashPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createAuthModule() -> AuthViewController {
        let view = AuthViewController()
        let presenter = AuthPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createLoginModule() -> LoginViewController {
        let view = LoginViewController()
        let model = LoginModel()
        let presenter = LoginPresenter(view: view, model: model)
        view.presenter = presenter
        model.presenter = presenter
        return view
    }
    
    func createEnterEmailModule() -> EnterEmailViewController {
        let view = EnterEmailViewController()
        let model = EnterEmailModel()
        let presenter = EnterEmailPresenter(view: view, model: model)
        view.presenter = presenter
        model.presenter = presenter
        return view
    }
}
