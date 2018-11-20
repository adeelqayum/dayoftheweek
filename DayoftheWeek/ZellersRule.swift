//
//  ZellersRule.swift
//  DayoftheWeek
//
//  Created by Adeel Qayum on 9/30/18.
//  Copyright © 2018 Adeel Qayum. All rights reserved.
//

import Foundation
import UIKit

class ZellersRule {
    
    var month = 02
    var day = 11
    var year = 1998
    
    func monthCode (month: Int) -> Int {
        if(month == 01) {
            return 13
        }
        else if(month == 02) {
            return 14
        }
        else if(month == 03) {
            return 3
        }
        else if(month == 04) {
            return 4
        }
        else if(month == 05) {
            return 5
        }
        else if(month == 06) {
            return 6
        }
        else if(month == 07) {
            return 7
        }
        else if(month == 08) {
            return 8
        }
        else if(month == 09) {
            return 9
        }
        else if(month == 10) {
            return 10
        }
        else if(month == 11) {
            return 11
        }
        else if(month == 12) {
            return 12
        }
        else {
            return 0
        }
    }
    
    
    func yearCode (year: Int, month: Int) -> Int {
        let digit1 = year % 10
        let digit2 = (year/10) % 10
        
        let yearString = String(digit2) + String(digit1)
        let yearNumber: Int = Int(yearString)!
        
        if((month == 01) || (month == 02)) {
            if(yearNumber == 00) {
                return yearNumber + 99
            }
            return yearNumber - 1
        }
        
        return yearNumber
    }
    
    func centuryCode (year: Int, month: Int) -> Int {
        let digit1 = year % 10
        let digit2 = (year/10) % 10
        let digit3 = (year/100) % 10
        let digit4 = (year/1000) % 10
        
        let yearString = String(digit2) + String(digit1)
        let yearNumber: Int = Int(yearString)!
        
        let centuryString = String(digit4) + String(digit3)
        let centuryNumber: Int = Int(centuryString)!
        
        if((yearNumber == 00) && (month == 01) && (month == 02)) {
            return centuryNumber - 1;
        }
        
        return centuryNumber
    }
    
    
    func gatherValue (monthValue: Int, dayValue: Int, yearValue: Int, centuryValue: Int) -> Int {
        
        let sum1 = (13 * (monthValue + 1))/5
        let sum2 = yearValue / 4
        let sum3 = centuryValue / 4
        let sum4 = 5 * centuryValue
        
        let value = dayValue + sum1 + yearValue + sum2 + sum3 + sum4
        
        let remainder = value % 7
        
        return remainder
    }
    
    func dayoftheweek (remainder: Int, monthActual: Int, dayActual: Int, yearActual: Int, textfield1: String, textfield2: String, textfield3: String) -> String {
        
        if(textfield1 == "") || (textfield2 == "") || (textfield3 == "") {
            return "Enter Values"
        }
        if(textfield3.count < 4) {
            return "Enter Valid Year"
        }
        if(monthActual > 12) {
            return "Enter Valid Month"
        }
        if(monthActual == 1) || (monthActual == 3) || (monthActual == 5) || (monthActual == 7) || (monthActual == 8) || (monthActual == 10) || (monthActual == 12) {
            if(dayActual > 31) {
                return "Enter Valid Day"
            }
        }
        if(monthActual == 4) || (monthActual == 6) || (monthActual == 9) || (monthActual == 11) {
            if(dayActual > 30) {
                return "Enter Valid Day"
            }
        }
        if(monthActual == 2) {
            if(yearActual % 4 != 0) {
                if(dayActual > 28) {
                    return "Enter Valid Day"
                }
            }
            else if(yearActual % 4 == 0) {
                if(yearActual % 400 == 0) {
                    if(dayActual > 29) {
                        return "Enter Valid Day"
                    }
                }
                else if(yearActual % 100 == 0) {
                    if(dayActual > 28) {
                        return "Enter Valid Day"
                    }
                }
            }
            else {
                if(dayActual > 29) {
                    return "Enter Valid Day"
                }
            }
        }
        if(remainder == 0)
        {
            return "Saturday"
        }
        else if(remainder == 1)
        {
            return "Sunday"
        }
        else if(remainder == 2)
        {
            return "Monday"
        }
        else if(remainder == 3)
        {
            return "Tuesday"
        }
        else if(remainder == 4)
        {
            return "Wednesday"
        }
        else if(remainder == 5)
        {
            return "Thursday"
        }
        else if(remainder == 6)
        {
            return "Friday"
        }
        else {
            return "invalid"
        }
    }
    
    func textcolor(displaylabel: String) -> UIColor {
        while (displaylabel == "Enter Values") ||  (displaylabel == "Enter Valid Month") || (displaylabel == "Enter Valid Day") || (displaylabel == "Enter Valid Year"){
            
            return UIColor.red
        }
        return UIColor.lightGray
    }

}
