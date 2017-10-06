//
//  ViewController.swift
//  Payday 2 XP Calculator
//
//  Created by Nikolas Beltran on 10/5/17.
//  Copyright © 2017 Nikolas Beltran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var xpTextField: UITextField!
    @IBOutlet weak var textbox4: UITextField!
    
    @IBOutlet weak var startlevel: UIPickerView!
    @IBOutlet weak var endlevel: UIPickerView!
    
    var currentLevelXP = "0"
    var desiredLevelXP = "0"
    
    var level = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
    
    var xp = ["0", "900", "2150", "3700", "5550", "7750", "10350", "13350", "16850", "20850", "25450", "30051", "34662", "39299", "43986", "48757", "53652", "58720", "64019", "69614", "75579", "81996", "88955", "96555", "104902", "114110", "124303", "135611", "148174", "162139", "177662", "194907", "214046", "235259", "258735", "284670", "313269", "344745", "379319", "417221", "458688", "503966", "553308", "606978", "665245", "728388", "796694", "870457", "949981", "1035577", "1127565", "1226272", "1332034", "1445195", "1566108", "1695133", "1832639", "1979002", "2134608", "2299850", "2475129", "2660855", "2857446", "3065327", "3284933", "3516707", "3761099", "4018567", "4289579", "4574610", "4874143", "5188670", "5518691", "5864713", "6227253", "6606835", "7003991", "7419262", "7853198", "8306355", "8779298", "9272601", "9786846", "10322622", "10880528", "11461170", "12065162", "12693127", "13345696", "14023507", "14727208", "15457455", "16214911", "17000247", "17814144", "18657290", "19530381", "20434122", "21369226", "22336413", "23336413"]
    
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
            //self.textbox1.text = self.xp[row]
            
            currentLevelXP = self.xp[row]
            
//            if ((Int(textbox2.text!)! - Int(textbox1.text!)!) < 0) {
//                self.textbox3.text = "--"
//                self.textbox4.isHidden = true
            
            if ((Int(desiredLevelXP)! - Int(currentLevelXP)!) < 0) {
                self.xpTextField.text = "--"
                self.textbox4.isHidden = true
            }
            else {
                //let largeNumber = (Int(textbox2.text!)! - Int(textbox1.text!)!)
                let largeNumber = (Int(desiredLevelXP)! - Int(currentLevelXP)!)
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = NumberFormatter.Style.decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
                self.xpTextField.text = formattedNumber
                self.textbox4.isHidden = false
            }
        }
        else if pickerView == endlevel {
            //self.textbox2.text = self.xp[row]
            
            desiredLevelXP = self.xp[row]
            
//            if ((Int(textbox2.text!)! - Int(textbox1.text!)!) < 0) {
//                self.textbox3.text = "--"
//                self.textbox4.isHidden = true
            
            if ((Int(desiredLevelXP)! - Int(currentLevelXP)!) < 0) {
                self.xpTextField.text = "--"
                self.textbox4.isHidden = true
            }
            else {
                //let largeNumber = (Int(textbox2.text!)! - Int(textbox1.text!)!)
                let largeNumber = (Int(desiredLevelXP)! - Int(currentLevelXP)!)
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = NumberFormatter.Style.decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
                self.xpTextField.text = formattedNumber
                self.textbox4.isHidden = false
            }
        }
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if (textField == self.textbox1) {
//            }
//        else if (textField == self.textbox2) {
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        xpTextField.text = "0"
        textbox4.text = "Experience Required"
        
        xpTextField.isEnabled = false
        
        textbox4.isHidden = true
        
        
        startlevel.delegate = nil; // NEW CODE
        startlevel.delegate = self;
        
        endlevel.delegate = nil; // NEW CODE
        endlevel.delegate = self;
        
        startlevel.layer.cornerRadius = 10.0
        startlevel.clipsToBounds = true
        
        endlevel.layer.cornerRadius = 10.0
        endlevel.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

