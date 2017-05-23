//
//  TipModel.swift
//  TipsyCalcApp
//
//  Created by Boxuan Zhu on 5/23/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import Foundation

class TipModel{
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _numberWayOfSplit: Int = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _userTotal: Double = 0
    var billAmount: Double {
        get{
            return _billAmount
        }
        set{
            _billAmount = newValue
        }
    }
    var tipPercent: Double {
        get{
            return _tipPercent
        }
        set{
            _tipPercent = newValue
        }
    }
    var numberWayOfSplit: Int{
        get{
            return _numberWayOfSplit
        }
        set{
            _numberWayOfSplit = newValue
        }
    }
    var tipAmount: Double{
        return _tipAmount
    }
    var totalAmount: Double{
        return _totalAmount
    }
    var userTotal: Double{
        return _userTotal
    }
    
    init(billAmount: Double, tipPercent: Double, wayOfSplit: Int){
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._numberWayOfSplit = wayOfSplit
    }
    
    func calculateTip(){
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
        _userTotal = totalAmount / Double(numberWayOfSplit)
        //print(userTotal)
        
    }
    
}

