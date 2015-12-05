//
//  PayViewController.swift
//  tips
//
//  Created by Himank Yadav on 12/5/15.
//  Copyright © 2015 himankyadav. All rights reserved.
//

import UIKit


class PayViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expireDateTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    //@IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Text field delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }
    
    
    // MARK: Actions
    
    @IBAction func donate(sender: AnyObject) {
        
        
    }
    
}

