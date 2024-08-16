//
//  SplashPresenter.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import Foundation

final class SplashPresenter: SplashPresenterProtocol {
    var completionHendler: ((Bool) -> Void)?
    
    weak var view: SplashViewProtocol?
    
    init(view: SplashViewProtocol? = nil) {
        self.view = view
    }
    
    func startAnimation() {
        view?.runAnimation()
    }
    
    func animationDidFinish(completed: Bool) {
        completionHendler?(completed)
    }
}
