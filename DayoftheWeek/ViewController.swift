//
//  ViewController.swift
//  DayoftheWeek
//
//  Created by Adeel Qayum on 9/30/18.
//  Copyright © 2018 Adeel Qayum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
@IBOutlet weak var monthlabel: UILabel!
@IBOutlet weak var daylabel: UILabel!
@IBOutlet weak var yearlabel: UILabel!
    
@IBOutlet weak var monthtext: UITextField!
@IBOutlet weak var daytext: UITextField!
@IBOutlet weak var yeartext: UITextField!
    
@IBOutlet weak var calculatebutton: UIButton!
    
@IBOutlet weak var displaylabel: UILabel!
    
let formula = ZellersRule()
let checker = InputValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.8667, green: 0.898, blue: 0.7176, alpha: 1.0)
        
        displaylabel.textColor = formula.textcolor(displaylabel: displaylabel.text!)
        
        //used to bring up the keyboard (see ReadMe for reasoning why it's commented out)
        //monthtext.becomeFirstResponder()
        
        self.monthtext.delegate = self
        self.daytext.delegate = self
        self.yeartext.delegate = self
        
        monthlabel.text = NSLocalizedString("str_monthlabel", comment: "")
        daylabel.text = NSLocalizedString("str_daylabel", comment: "")
        yearlabel.text = NSLocalizedString("str_yearlabel", comment: "")
        displaylabel.text = NSLocalizedString("str_displaylabel", comment: "")
        
    }

    //Checks for valid input in all textFields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let monthInt = Int(monthtext.text!) ?? 0
        let dayInt = Int(daytext.text!) ?? 0
        let yearInt = Int(yeartext.text!) ?? 0
        
        if let current = textField.text {
            
            // backspace
            if string.count == 0 {
                return true
            }
            if textField.isEqual(monthtext) {
                return checker.inputValidMonth(input: string, characterCount: current.count, digitValue: monthInt)
            }
            if textField.isEqual(daytext) {
                 return checker.inputValidDay(input: string, characterCount: current.count, digitValue: dayInt)
            }
            if textField.isEqual(yeartext) {
                 return checker.inputValidYear(input: string, characterCount: current.count, digitValue: yearInt)
            }
        }
        return false
    }
    
    //Runs Zeller's Formula to calculate day of the week
    @IBAction func calculatebutton(_ sender: Any) {
        let monthInt = Int(monthtext.text!) ?? 0
        let dayInt = Int(daytext.text!) ?? 0
        let yearInt = Int(yeartext.text!) ?? 0
        
        let monthValue = formula.monthCode(month: monthInt)
        let dayValue = dayInt
        let yearValue = formula.yearCode(year: yearInt, month: monthInt)
        let centuryValue = formula.centuryCode(year: yearInt, month: monthInt)
        
        let remainder = formula.gatherValue(monthValue: monthValue, dayValue: dayValue, yearValue: yearValue, centuryValue: centuryValue)
        
        self.displaylabel.text = formula.dayoftheweek(remainder: remainder, monthActual: monthInt, dayActual: dayInt, yearActual: yearInt, textfield1: monthtext.text!, textfield2: daytext.text!, textfield3: yeartext.text!)
        
        displaylabel.textColor = formula.textcolor(displaylabel: displaylabel.text!)

    }
    
    
    
    
}

