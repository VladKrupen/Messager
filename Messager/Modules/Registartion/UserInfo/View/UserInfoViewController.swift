//
//  UserInfoViewController.swift
//  Messager
//
//  Created by Vlad on 23.08.24.
//

import UIKit

final class UserInfoViewController: UIViewController, UserInfoViewProtocol {
    
    var presenter: UserInfoPresenterProtocol!
    private let userInfoView = UserInfoView()
    
    override func loadView() {
        super.loadView()
        view = userInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonTapped()
        imageViewTapped()
    }

    private func nextButtonTapped() {
        userInfoView.nextButtonAction = { [weak self] firstName, lastName in
            
        }
    }
    
    private func imageViewTapped() {
        userInfoView.imageViewAction = { [weak self] in
            self?.showImagePickerActionSheet()
        }
    }
    
    deinit {
        print("deinit UserInfoVC")
    }
}

extension UserInfoViewController {
    private func showImagePickerActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: "Выберите фото", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { [weak self] _ in
            print("Gallery")
        }
        let cameraAction = UIAlertAction(title: "Сделать фото", style: .default) { [weak self] _ in
            print("Camera")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(actionSheet, animated: true)
        }
    }
}
