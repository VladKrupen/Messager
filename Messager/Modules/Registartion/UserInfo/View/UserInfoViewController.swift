//
//  UserInfoViewController.swift
//  Messager
//
//  Created by Vlad on 23.08.24.
//

import UIKit
import PhotosUI

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
    
    private func showImagePickerActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: "Выберите фото", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { [weak self] _ in
            print("Gallery")
            self?.presentGallery()
        }
        let cameraAction = UIAlertAction(title: "Сделать фото", style: .default) { [weak self] _ in
            print("Camera")
            self?.presentCamera()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(actionSheet, animated: true)
        }
    }
    
    deinit {
        print("deinit UserInfoVC")
    }
}

//MARK: UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension UserInfoViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private func presentCamera() {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraCaptureMode = .photo
        camera.cameraDevice = .front
        camera.cameraFlashMode = .off
        camera.delegate = self
        DispatchQueue.main.async { [weak self] in
            self?.present(camera, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.userInfoView.updateImage(image: image)
            self?.dismiss(animated: true)
        }
    }
}

//MARK: PHPickerViewControllerDelegate
extension UserInfoViewController: PHPickerViewControllerDelegate {
   
    private func presentGallery() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 1
        configuration.filter = .images
        let gallery = PHPickerViewController(configuration: configuration)
        gallery.modalPresentationStyle = .fullScreen
        gallery.delegate = self
        DispatchQueue.main.async { [weak self] in
            self?.present(gallery, animated: true)
        }
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        if let itemProvider = results.first?.itemProvider {
            
            guard itemProvider.canLoadObject(ofClass: UIImage.self) else {
                print("Item provider can't load object of type UIImage")
                return
            }
            
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                guard error == nil else {
                    print("Error loading image: \(error!.localizedDescription)")
                    return
                }
                
                guard let image = image as? UIImage else {
                    print("Could not convert loaded data to UIImage")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.userInfoView.updateImage(image: image)
                    picker.dismiss(animated: true)
                }
            }
        }
        if results.isEmpty {
            self.dismiss(animated: true)
        }
    }
}
