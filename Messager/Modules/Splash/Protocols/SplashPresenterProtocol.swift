//
//  SplashPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    var completionHandler: ((Bool) -> Void)? { get set }
    
    func startAnimation()
    func animationDidFinish(completed: Bool)
}
