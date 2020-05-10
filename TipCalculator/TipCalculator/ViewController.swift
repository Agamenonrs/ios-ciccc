//
//  ViewController.swift
//  TipCalculator
//
//  Created by Agamenon Rocha Dos Santos on 08/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var adjustTipPercentage: UISlider!
    @IBOutlet weak var labelPercentage: UILabel!
    
    var percentage : Float = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adjustTipPercentage.setValue(15, animated: false)
        labelPercentage.text = "\(percentage) %"
        tipAmountLabel.text = "0.0"
        registerForKeyboardNotifications()
    }
    
    @IBAction func ajustPercentageChanged(_ sender: UISlider) {
        print("percentage changed")
        if let bill = billAmountTextField.text{
            percentage = adjustTipPercentage.value
            print(bill)
            let billAmount = Float(bill)
            let tip = billAmount! * (percentage / 100)
            tipPercentageTextField.text = String(format : "%.2f", percentage)
            labelPercentage.text = tipPercentageTextField.text
            tipAmountLabel.text = String(format: "$ %.2f", tip )
        }
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        if let bill = billAmountTextField.text{
            if let tipPercentage = tipPercentageTextField.text{
                print(bill)
                let billAmount = Float(bill)
                percentage = Float(tipPercentage)!
                let tip = billAmount! * (percentage / 100)
                tipAmountLabel.text = String(format: "%.2f",tip)
                adjustTipPercentage.setValue(percentage, animated: false)
                labelPercentage.text = tipPercentage
            }
            
        }
    }
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notification: NSNotification){
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,bottom: keyboardSize.height,right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification){
        
    }
    

}

