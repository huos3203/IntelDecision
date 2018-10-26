//
//  SetCordonValueView.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/26.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit

class SetCordonValueView: UIView {


    @IBOutlet var leftStackView:UIView!
    @IBOutlet var rightStackView:UIView!
    @IBOutlet var nameButton:UIButton!
    
    @IBOutlet var valueFields: [UITextField]!  //98
    @IBOutlet var unitLabels:[UILabel]!  //76
    @IBOutlet var operatorButtons:[UIButton]! //54
    @IBOutlet var xialButtons:[UIButton]!  //32
    @IBOutlet var exapleLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        leftStackView.layer.borderColor = UIColor.lightGray.cgColor
        leftStackView.layer.borderWidth = 0.5
        leftStackView.layer.cornerRadius = 5
        leftStackView.layer.masksToBounds = true
        
        rightStackView.layer.borderColor = UIColor.lightGray.cgColor
        rightStackView.layer.borderWidth = 0.5
        rightStackView.layer.cornerRadius = 5
        rightStackView.layer.masksToBounds = true
        
        nameButton.layer.cornerRadius = 5
        nameButton.layer.masksToBounds = true
        
    }

    
    //MARK: 切换逻辑运算符
    @IBAction func ibaSwitchOperatorAction(_ sender: UIButton) {
        let alertView = AlertListFullView.init(true)
        var alertList = [AlertlistModel]()
        while alertList.count < 4 {
            let model = AlertlistModel()
            model.name = ">"
            model.id = "1"
            alertList.append(model)
        }
        var tag = 0
        switch sender.tag{
        case 3,5:
            tag = 5
        case 2,4:
            tag = 4
        default: break
        }
        let operBut:UIButton = self.viewWithTag(tag) as! UIButton
        alertView.showlistView(target: operBut, alertData: alertList) { (model) in
            operBut.setTitle(model.name, for: UIControl.State.normal)
        }
    }
}


