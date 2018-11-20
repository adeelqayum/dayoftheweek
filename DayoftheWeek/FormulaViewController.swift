//
//  FormulaViewController.swift
//  DayoftheWeek
//
//  Created by Adeel Qayum on 10/2/18.
//  Copyright © 2018 Adeel Qayum. All rights reserved.
//

import Foundation
import UIKit

class FormulaViewController: UIViewController, UITextFieldDelegate{

@IBOutlet weak var formulaused: UILabel!
@IBOutlet weak var zellersrule: UILabel!
@IBOutlet weak var wiki: UILabel!
@IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.7294, green: 0.8745, blue: 0.8784, alpha: 1.0)
        
        formulaused.text = NSLocalizedString("str_formulaused", comment: "")
        zellersrule.text = NSLocalizedString("str_zellersrule", comment: "")
        wiki.text = NSLocalizedString("str_wiki", comment: "")
        
    }
}
