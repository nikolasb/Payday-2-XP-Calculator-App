//
//  ViewController.swift
//  Payday 2 XP Calculator
//
//  Created by Nikolas Beltran on 10/5/17.
//  Copyright © 2017 Nikolas Beltran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var textbox1: UITextField!
    @IBOutlet weak var textbox2: UITextField!
    
    @IBOutlet weak var startlevel: UIPickerView!
    @IBOutlet weak var endlevel: UIPickerView!
    
    var level = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
    
    var xp = ["900", "1400", "3200", "6200", "13000", "17000"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = level.count
        if pickerView == endlevel {
            countrows = self.level.count
        }
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == startlevel {
            let titleRow = level[row]
            return titleRow
        }
        else if pickerView == endlevel{
            let titleRow = level[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == startlevel {
            self.textbox1.text = self.level[row]
            //self.startlevel.isHidden = true
        }
        else if pickerView == endlevel {
            self.textbox2.text = self.level[row]
            //self.endlevel.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.textbox1) {
            //self.startlevel.isHidden = false
            }
        else if (textField == self.textbox2) {
            //self.endlevel.isHidden = false
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

