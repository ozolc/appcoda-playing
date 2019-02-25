//
//  EditItemViewController.swift
//  InAppComm
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

protocol EditItemViewControllerDelegate {
    func shouldAdd(item: String)
    func isItemPresent(item: String) -> Bool
}

import UIKit


class EditItemViewController: UIViewController {
    
    var delegate: EditItemViewControllerDelegate!
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    
    
    // MARK: - Properties
    
    var editedItem: String?
    
    
    
    // MARK: - View Init Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        // Show the keyboard automatically when the view is about to appear.
        textField.becomeFirstResponder()
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    // MARK: - Custom Methods
    
    fileprivate func setupUI() {
        textField.delegate = self
        
        if editedItem == nil {
            deleteButton.isEnabled = false
        } else {
            textField.text = editedItem
        }
    }
    
    
    
    // MARK: - IBAction Methods
    
    @IBAction func saveItem(_ sender: Any) {
        guard let text = textField.text else { return }
        
        if text != "" {
            if let delegate = delegate {
                if !delegate.isItemPresent(item: text) {
                    // Item doesn't exist in the ittems collection,
                    // so let's add it now.
                    delegate.shouldAdd(item: text)
                    navigationController?.popViewController(animated: true)
                
                } else {
                    // Item exists already in the items collection.
                    // Show an alert to indicate that.
                    let alert = UIAlertController(title: "Item exists", message: "\(text) already exists in your shopping list.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
            
            @IBAction func deleteItem(_ sender: Any) {
                
            }
            
        }
        
        
        
        
        // MARK: - UITextFieldDelegate
        extension EditItemViewController: UITextFieldDelegate {
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                saveItem(self)
                return true
            }
}


