//
//  ChatsPresenter.swift
//  Messager
//
//  Created by Vlad on 7.09.24.
//

import Foundation

final class ChatsPresenter: ChatsPresenterProtocol {
    var completionHandler: (() -> Void)?
    
    weak var view: ChatsViewProtocol?
    
    init(view: ChatsViewProtocol? = nil) {
        self.view = view
    }
}
