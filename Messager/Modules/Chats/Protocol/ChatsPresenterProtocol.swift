//
//  ChatsPresenterProtocol.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import Foundation

protocol ChatsPresenterProtocol: AnyObject {
    var completionHandler: (() -> Void)? { get set }
}
