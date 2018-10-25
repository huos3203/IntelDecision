//
//  IntelDesListViewCell.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/25.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit

class IntelDesModel: NSObject {
    var name:String!
    var value:String!
    var cordon:String!
    var note:String!
    var icon:String!
    
    convenience init(_ test:Bool) {
        self.init()
        name = "冰箱温度器"
        value = "12"
        cordon = "23"
        note = "sdfhhhsdfhsdhf"
        icon = ""
    }
}


class IntelDesListViewCell: UITableViewCell {

    
    @IBOutlet var ibRootView: UIView!
    @IBOutlet var ibNameLabel: UILabel!
    @IBOutlet var ibValueLabel: UILabel!
    @IBOutlet var ibCordonLabel: UILabel!
    @IBOutlet var ibSubValueLabel: UILabel!
    @IBOutlet var ibNoteLabel: UILabel!
    @IBOutlet var ibIntelIconView: UIImageView!
    var newModel:IntelDesModel!
    var model:IntelDesModel{
        set(newValue){
            newModel = newValue
            ibNameLabel.text = newValue.name
            ibValueLabel.text = newValue.value
            ibSubValueLabel.text = newValue.value
            ibCordonLabel.text = newValue.cordon
            ibNoteLabel.text = newValue.note
            ///请求网络图片
//            ibIntelIconView.image =
        }
        get{
            return newModel
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ibRootView.layer.cornerRadius = 10
        ibRootView.layer.masksToBounds = true
    }

    @IBAction func ibDelAction(_ sender: Any) {
        
    }
    
    @IBAction func ibSetAction(_ sender: Any) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
