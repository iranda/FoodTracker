//
//  ViewController.swift
//  FoodTracker
//
//  Created by Daria Daria on 2017-02-23.
//  Copyright © 2017 d.sirous. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Properties
    @IBOutlet weak var nameTextFiel: UITextField!
    @IBOutlet weak var meelNameLabel: UILabel!
    @IBOutlet weak var setDefaultLabelText: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextFiel.delegate = self;
        self.photoImageView.isUserInteractionEnabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITextField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.meelNameLabel.text = textField.text;
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        self.nameTextFiel.resignFirstResponder();
        
        let imagePickerController = UIImagePickerController();
        imagePickerController.sourceType = .photoLibrary;
        imagePickerController.delegate = self;
        present(imagePickerController, animated: true, completion: nil);
    }
    
    // UIImagePickerController delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
        UIImage else {
          fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        };
        self.photoImageView.image = selectedImage;
        
        dismiss(animated: true, completion: nil);
    }

}

