//
//  ViewController.swift
//  FoodTracker
//
//  Created by Daria Daria on 2017-02-23.
//  Copyright © 2017 d.sirous. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Properties
    @IBOutlet weak var nameTextFiel: UITextField!
    @IBOutlet weak var meelNameLabel: UILabel!
    @IBOutlet weak var setDefaultLabelText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextFiel.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.meelNameLabel.text = textField.text;
    }


}

