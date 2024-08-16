//
//  SplashViewController.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import UIKit
import Lottie

final class SplashViewController: UIViewController, SplashViewProtocol {
        
    var presenter: SplashPresenterProtocol!
    
    private var lottieAnimation = LottieAnimationView(name: "Splash")
    
    override func loadView() {
        super.loadView()
        view = lottieAnimation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.startAnimation()
    }
    
    func runAnimation() {
        lottieAnimation.play { [weak self] completed in
            self?.presenter.animationDidFinish(completed: completed)
        }
    }
}
