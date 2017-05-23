//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by Boxuan Zhu on 5/23/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var waySplitLbl: UILabel!
    @IBOutlet weak var waySplitSlider: UISlider!
    @IBOutlet weak var yourTotalLbl: UILabel!
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0, wayOfSplit: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValue()
        updateUI()
        
    }

    func setTipCalculationValue(){
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.numberWayOfSplit = Int(waySplitSlider.value)
        print("slider value  is \(waySplitSlider.value)")
        print("tip.numberWayOfSplit is \(tip.numberWayOfSplit)")
        //print(tip.numberWayOfSplit)
        tip.calculateTip()
    }
    func updateUI(){
        tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
        waySplitLbl.text = "\(Int(waySplitSlider.value)) Way Split"
        yourTotalLbl.text = String(format: "$%0.2f", tip.userTotal)
    }
    
    @IBAction func billAmountWasChanged(_ sender: Any) {
        setTipCalculationValue()
        updateUI()
    }

    @IBAction func tipPercentChanged(_ sender: UISlider) {
        //print(tipPercentageSlider.value)
        let step: Float = 100
        let roundedValue = round(sender.value*step)/step
        sender.value = roundedValue
        
        setTipCalculationValue()
        updateUI()
    }
    @IBAction func waysToSplitChanged(_ sender: UISlider) {
        sender.value = round(sender.value)
        setTipCalculationValue()
        updateUI()
    }

}

