//
//  SecondViewController.swift
//  To Do List
//
//  Created by Alex Retter on 3/11/2016.
//  Copyright (c) 2015 Alex Retter. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var objectTextField: UITextField!
    
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        objects.append(objectTextField.text!)
        
        objectTextField.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(objects, forKey: "objects")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.objectTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        objectTextField.resignFirstResponder()
        return true
        
    }
    

}

