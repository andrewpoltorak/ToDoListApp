//
//  SecondViewController.swift
//  ToDoListApp
//
//  Created by Preferiti_mac on 16.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        if inputTextField.text != "" {
            list.append(inputTextField.text!)
            inputTextField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

