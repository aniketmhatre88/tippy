//
//  SettingsViewController.swift
//  tippy
//
//  Created by Mhatre, Aniket on 3/19/17.
//  Copyright © 2017 Mhatre, Aniket. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var defaultPercentPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultPercentPicker.delegate = self
        defaultPercentPicker.dataSource = self
        
        let defaultTipPercent = (UserDefaults.standard.object(forKey: "default_tip_percent") ?? 0) as! Int
        defaultPercentPicker.selectRow(defaultTipPercent, inComponent: 0, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.tipPercents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Constants.tipPercents[row])%"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.setValue(row, forKey: "default_tip_percent")
    }

}
