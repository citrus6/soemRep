//
//  NewMomentsViewController.swift
//  MyDiary
//
//  Created by Виктор on 16.09.2018.
//  Copyright © 2018 Виктор. All rights reserved.
//

import Foundation
import UIKit

class NewMomentViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: NSLocalizedString("Источник фотографии", comment: "Источник фотографии"), message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: NSLocalizedString("Камера", comment: "Камера"), style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .camera)
            })
            let photoLibAction = UIAlertAction(title: NSLocalizedString("Фото", comment: "Фото"), style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .photoLibrary)
            })
            let cancelAction = UIAlertAction(title: NSLocalizedString("Отмена", comment: "Отмена"), style: .cancel, handler: nil)
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func chooseImagePickerAction(source: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}

extension NewMomentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
    }
}
