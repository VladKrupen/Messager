//
//  UserInfoModel.swift
//  Messager
//
//  Created by Vlad on 23.08.24.
//

import Foundation

final class UserInfoModel: UserInfoModelProtocol {
    
    weak var presenter: UserInfoPresenterProtocol?
    
    deinit {
        print("deinit UserInfoModel")
    }
}
