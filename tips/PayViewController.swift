//
//  PayViewController.swift
//  tips
//
//  Created by Himank Yadav on 12/5/15.
//  Copyright © 2015 himankyadav. All rights reserved.
//

import UIKit


class PayViewController: UIViewController {
//
//    @IBOutlet weak var emailTextField: UITextField!
//    @IBOutlet weak var cardNumberTextField: UITextField!
//    @IBOutlet weak var expireDateTextField: UITextField!
//    @IBOutlet weak var cvcTextField: UITextField!
//    @IBOutlet weak var amountTextField: UITextField!
    
    
    //@IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Text field delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        
//        return true
//    }
//    
//    // MARK: Actions
//    
//    @IBAction func donate(sender: AnyObject) {
//        
//        var stripCard = STPCard()
//        
//        // Split the expiration date to extract Month & Year
//        if self.expireDateTextField.text!.isEmpty == false {
//            let expirationDate = self.expireDateTextField.text!.componentsSeparatedByString("/")
//            let expMonth = UInt(Int(expirationDate[0])!)
//            let expYear = UInt(Int(expirationDate[1])!)
//            
//            // Send the card info to Strip to get the token
//            stripCard.number = self.cardNumberTextField.text
//            stripCard.cvc
//                = self.cvcTextField.text
//            stripCard.expMonth = expMonth
//            stripCard.expYear = expYear
//        }
//    }
    
}

