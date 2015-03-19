//
//  ViewController.swift
//  tip
//
//  Created by Hsin Yi Huang on 3/7/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    //view block definition
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.resultView.alpha = 0
        self.tipControl.alpha = 0
        self.billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editingChanged(sender: AnyObject) {
        //println(resultView.frame.height)
        //prevent user from deleting the $ sign
        if (billField.text == "" || billField.text == "$"){
            billField.text = "$"
            UIView.animateWithDuration(0.3, animations: {
                self.billField.frame = CGRect(x: 31, y: 152, width: 259, height: 73)
                self.tipControl.frame = CGRect(x: 31, y: 243, width: 259, height: 29)
                 self.tipControl.alpha = 0
                self.resultView.alpha = 0
                self.resultView.frame = CGRect(x: 0, y: 273, width: 320, height: 345)
            })
        }
        else{
            UIView.animateWithDuration(0.3, animations: {
                self.billField.frame = CGRect(x: 31, y: 72, width: 259, height: 73)
                self.tipControl.frame = CGRect(x: 31, y: 173, width: 259, height: 29)
                self.tipControl.alpha = 1
                self.resultView.alpha = 1
                self.resultView.frame = CGRect(x: 0, y: 223, width: 320, height: 345)
            })
            
        }
        

       
       
      var tipPercentage = [0.18, 0.2, 0.22]
        println(billField.text)
        
          var billAmount = NSString(string: dropFirst(billField.text)).doubleValue
        
       println(billAmount)
        var tip = billAmount * tipPercentage[tipControl.selectedSegmentIndex]
        var total = billAmount+tip
    
        tipLabel.text = "$\(tip)"
         totalLabel.text = "$\(total)"
        totalLabel2.text = "$\(total/2)"
        totalLabel3.text = "$\(total/3)"
        totalLabel4.text = "$\(total/4)"
        //formatting
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalLabel2.text = String(format: "$%.2f", total/2)
        totalLabel3.text = String(format: "$%.2f", total/3)
        totalLabel4.text = String(format: "$%.2f", total/4)
       
    }

    
    @IBAction func tipControlPressed(sender: AnyObject) {
        //close keyboard if billamount is entered
        if (!(billField.text == "" || billField.text == "$")){
            closeKeyboard(sender)
            editingChanged(sender)
        }
        
    }
    
    

    
    @IBAction func closeKeyboard(sender: AnyObject) {
        if (billField.text != "$"){
            view.endEditing(true)
            UIView.animateWithDuration(0.3, animations: {
                self.billView.alpha = 1
                
            })
        }
    }
    
    
    //additional function: swipe to left to clear billfield
    @IBAction func clearField(sender: AnyObject) {
        //to be implemented
        
    }
    
    
}

