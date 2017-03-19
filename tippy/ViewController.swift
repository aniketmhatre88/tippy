//
//  ViewController.swift
//  tippy
//
//  Created by Mhatre, Aniket on 3/17/17.
//  Copyright © 2017 Mhatre, Aniket. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTipControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = Constants.tipPercents
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = (bill * Double(tipPercentages[tipControl.selectedSegmentIndex]))/100
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    private func setupTipControl() {
        tipControl.removeAllSegments()
        for (index, element) in Constants.tipPercents.enumerated() {
            tipControl.insertSegment(withTitle: "\(element)%", at: index, animated: false)
        }
        
        selectDefaultTipPercentage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectDefaultTipPercentage()
        calculateTip(NSObject())
    }
    
    private func selectDefaultTipPercentage() {
        let defaultTipPercent = (UserDefaults.standard.object(forKey: "default_tip_percent") ?? 0) as! Int
        tipControl.selectedSegmentIndex = defaultTipPercent
    }

}

