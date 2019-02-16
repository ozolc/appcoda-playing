//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by Maksim Nosov on 16/02/2019.
//  Copyright © 2019 NosovML. All rights reserved.
//

import UIKit

class NewRestaurantController: UITableViewController {
    
    @IBOutlet var nameTextField: RoundedTextField! {
        didSet {
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    
    @IBOutlet var typeTextField: RoundedTextField! {
        didSet {
            typeTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    
    @IBOutlet var addressTextField: RoundedTextField! {
        didSet {
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    
    @IBOutlet var phoneTextField: RoundedTextField! {
        didSet {
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }
    
    @IBOutlet var descriptonTextView: UITextView! {
        didSet {
            descriptonTextView.tag = 5
            descriptonTextView.layer.cornerRadius = 5.0
            descriptonTextView.layer.masksToBounds = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

extension NewRestaurantController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let newTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            newTextField.becomeFirstResponder()
        }
        return true
    }
}
