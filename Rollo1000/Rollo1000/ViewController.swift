//
//  ViewController.swift
//  Rollo1000
//
//  Created by Alberto Pacheco on 27/10/15.
//  Copyright © 2015 Alberto Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    let digits = ["0","1","2","3","4","5","6","7","8","9"]

    var oculto: Int = 0

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return digits.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return digits[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        display.text = digits[row]
        let num:Int = Int(display.text!)!
        if num == oculto {
            display.text = "Ganaste!"
            oculto = generaNum(0,9)
        } else if num < oculto {
            display.text = "+Grande"
        } else {
            display.text = "+chico"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "Selecciona num 1-1000"
        picker.dataSource = self
        picker.delegate = self
        oculto = generaNum(0,9)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

