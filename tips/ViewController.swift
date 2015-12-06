//
//  ViewController.swift
//  tips
//
//  Created by Himank Yadav on 11/30/15.
//  Copyright © 2015 himankyadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPer: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var pointerValue = 0.00
    
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
        cell.textLabel?.text = String(format: "$%.2f", (tipValue + billAmt)/rowNum)
        tipPer.text = "\((tipNum)) \(tipValue) \(billAmt)"
    
        totalLabel.text = String(format: "$%.2f", (tipValue + billAmt))
        tipLabel.text = String(format: "$%.2f", (tipValue))
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        [billField.becomeFirstResponder()]

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
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

