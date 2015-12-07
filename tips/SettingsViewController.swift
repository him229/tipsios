//
//  SettingsViewController.swift
//  tips
//
//  Created by Himank Yadav on 12/3/15.
//  Copyright © 2015 himankyadav. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTextField: UITextField!
//    var val = 20
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundPay.png")!)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        defaultTextField.text = "\(defaults.integerForKey("defaultTip"))"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func update(sender: AnyObject) {
        var updatedValue = Int(defaultTextField.text!)
        
        defaults.setInteger(updatedValue!, forKey: "defaultTip")
        defaults.synchronize()
        
//        val = defaults.integerForKey("defaultTip")
    
    }
    
    

}
