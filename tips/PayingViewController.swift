//
//  PayingViewController.swift
//  tips
//
//  Created by Himank Yadav on 12/5/15.
//  Copyright © 2015 himankyadav. All rights reserved.
//

import UIKit

class PayingViewController: UIViewController {
    
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var cardNumberTextField: UITextField!
        @IBOutlet weak var expireDateTextField: UITextField!
        @IBOutlet weak var cvcTextField: UITextField!
        @IBOutlet weak var amountTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
        func textFieldShouldReturn(textField: UITextField) -> Bool {
    
            return true
        }
    
        // MARK: Actions
    
        @IBAction func donate(sender: AnyObject) {
    
            var stripCard = STPCard()
    
            // Split the expiration date to extract Month & Year
            if self.expireDateTextField.text!.isEmpty == false {
                let expirationDate = self.expireDateTextField.text!.componentsSeparatedByString("/")
                let expMonth = UInt(Int(expirationDate[0])!)
                let expYear = UInt(Int(expirationDate[1])!)
    
                // Send the card info to Strip to get the token
                stripCard.number = self.cardNumberTextField.text
                stripCard.cvc
                    = self.cvcTextField.text
                stripCard.expMonth = expMonth
                stripCard.expYear = expYear
            }
            
            do {
                try stripCard.validateCardReturningError()
                
                STPAPIClient.sharedClient().createTokenWithCard(
                    stripCard,
                    completion: { (token: STPToken?, error: NSError?) -> Void in
                        
                        if error != nil {
                            self.handleError(error!)
                            return
                        }
                        self.postStripeToken(token!)
                })
            } catch {
                print("There was an error.")
            }
    }
    
    func handleError(error: NSError) {
        UIAlertView(title: "Please Try Again",
            message: error.localizedDescription,
            delegate: nil,
            cancelButtonTitle: "OK").show()
        
    }
    func postStripeToken(token: STPToken){
        
        let URL = "http://localhost/donate/payment.php"
        let params = ["stripeToken": token.tokenId,
            "amount": self.amountTextField.text!.toInt()!,
            "currency": "usd",
            "description": self.emailTextField.text]
        
        let manager = AFHTTPRequestOperationManager()
        manager.POST(URL, parameters: params, success: { (operation, responseObject) -> Void in
            
            if let response = responseObject as? [String: String] {
                UIAlertView(title: response["status"],
                    message: response["message"],
                    delegate: nil,
                    cancelButtonTitle: "OK").show()
            }
            
            }) { (operation, error) -> Void in
                self.handleError(error!)
        }
    
    }
}