//
//  InputValidator.swift
//  DayoftheWeek
//
//  Created by Adeel Qayum on 10/1/18.
//  Copyright © 2018 Adeel Qayum. All rights reserved.
//

import Foundation

class InputValidator {
    
    let maxCharacterCount = 2
    let maxCharacterCountYear = 4
    let validCharacters = "1234567890"

    func inputValidMonth(input: String, characterCount: Int, digitValue: Int) -> Bool {
        if (characterCount < maxCharacterCount) && validNumbers(input: input){
            return true
        } else {
            return false
        }
    }
    
    func inputValidDay(input: String, characterCount: Int, digitValue: Int) -> Bool {
        if (characterCount < maxCharacterCount) && validNumbers(input: input) {
            return true
        } else {
            return false
        }
    }
    
    func inputValidYear(input: String, characterCount: Int, digitValue: Int) -> Bool {
        if (characterCount < maxCharacterCountYear) && validNumbers(input: input){
            return true
        } else {
            return false
        }
    }
    
    func validNumbers (input: String) -> Bool {
        for char in input {
            if validCharacters.contains(char) {
                return true
            }
        }
        return false
    }
    
    func validMonth(input: Int) -> Bool {
        if (input < 12) && (input > 0){
            return true
        } else {
            return false
        }
    }
}
