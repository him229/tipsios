//
//  ViewController.swift
//  tips
//
//  Created by Himank Yadav on 11/30/15.
//  Copyright © 2015 himankyadav. All rights reserved.
//

import UIKit

extension Double {
    var asLocaleCurrency:String {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}

class ViewController: UIViewController, UITableViewDelegate{

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPer: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var blankView: UIView!
    var pointerValue = 0.00
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    
    @IBAction func sliderMoved(sender: AnyObject) {
        //print(tipSlider.value)
        table.reloadData()
        
        if(Double(tipSlider.value) != pointerValue){tipControl.selectedSegmentIndex = -1}

    }
    
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        var billAmt = Double(billField.text!._bridgeToObjectiveC().doubleValue)

        let tipNum = Double(Int(tipSlider.value * 100))
        let tipValue = (tipNum/100.00) * billAmt
        var rowNum = Double(indexPath.row)+1
        var listStar = ["","*       ", "* *       ","* * *       ","* * * *       "]
        //cell.textLabel?.text = String(format: "$%.2f", ((tipValue + billAmt)/rowNum).asLocaleCurrency)
        cell.textLabel?.text = listStar[Int(rowNum)]+((tipValue + billAmt)/rowNum).asLocaleCurrency

        cell.textLabel?.textAlignment = .Center
        
        tipPer.text = "\((tipNum)) %"
    
        //totalLabel.text = String(format: "$%.2f", (tipValue + billAmt))
        totalLabel.text = (tipValue + billAmt).asLocaleCurrency
        tipLabel.text = (tipValue).asLocaleCurrency
        
        
        
        return cell
    }
//    
//    func repeatString(n: Int, s: String) -> String {
//        return Array((count: n, repeatedValue: s) as! [String]).joinWithSeparator("")
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        [billField.becomeFirstResponder()]
//        self.blankView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundPay.png")!)
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundPay.png")!)
        self.view.backgroundColor = UIColor(red:0.70, green:0.92, blue:0.95, alpha:1.0)
        self.blankView.backgroundColor = UIColor(red:0.70, green:0.92, blue:0.95, alpha:1.0)
        
        self.billField.frame.origin.y = 282



    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let intValue = defaults.integerForKey("defaultTip")
        let numberFormatter = NSNumberFormatter()
        let number = numberFormatter.numberFromString(String(intValue))
        tipSlider.value = (number!.floatValue/100)
        table.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let intValue = defaults.integerForKey("defaultTip")
        let numberFormatter = NSNumberFormatter()
        let number = numberFormatter.numberFromString(String(intValue))
        tipSlider.value = (number!.floatValue/100)
        table.reloadData()
        print(self.billField.frame.origin.y)



    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
//        let amount = Double(billField.text!)
//        let amountString = amount!.asLocaleCurrency
//        print(amount!.asLocaleCurrency)
//        billField.text = Double(billField.text!)?.asLocaleCurrency
        
        self.blankView.hidden = true
        self.billField.frame.origin.y = 82
        
        if (billField.text == ""){
            UIView.animateWithDuration(1.0, animations: {
                //self.blankView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                self.blankView.hidden = false
                
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(CGPoint: CGPointMake(self.billField.center.x-10, self.billField.center.y))
                animation.toValue = NSValue(CGPoint: CGPointMake(self.billField.center.x+10, self.billField.center.y))
           self.billField.layer.addAnimation(animation, forKey: "position")
                
                self.billField.frame.origin.y += 200             })
        }
        
        var tipPercentages = ["0.15","0.2","0.25"]
        var tipPercentage = "0"
        if(tipControl.selectedSegmentIndex != -1){
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]}
        else{
            tipPercentage="20"
        }
        pointerValue = Double(tipPercentage)!
        
        let numberFormatter = NSNumberFormatter()
        let number = numberFormatter.numberFromString(tipPercentage)
        let tipPercentageFloat = number!.floatValue
        
        tipSlider.value = tipPercentageFloat
        
        if(tipSlider.value != tipPercentageFloat){tipControl.selectedSegmentIndex = -1}
        
//        var billAmountStr = billField.text!
//        var billAmount = billAmountStr._bridgeToObjectiveC().doubleValue
//        var tip = tipPercentage * billAmount
//        var total = tip + billAmount
//        
//        tipLabel.text = "$\(tip)"
//        
//        totalLabel.text = "$\(total)"
//        
//        tipLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
        
        table.reloadData()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
}

