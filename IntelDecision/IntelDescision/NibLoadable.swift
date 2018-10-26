//
//  NibLoadable.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/26.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit
/**
 面向协议开发：封装loadnib方法
 
 /2.在需要使用XIB加载的页面实现该协议方法
     class DemoView: UIView ,NibLoadable{
     }
 - xib文件与类名同名的情况
     let demoView = DemoView.loadFromNib()
 - xib文件与类名不相同的情况
     let testV = TestView.loadFromNib("TestView0")
 */
protocol NibLoadable {
}
extension NibLoadable where Self : UIView {
    //在协议里面不允许定义class 只能定义static
    static func loadFromNib(_ nibname: String? = nil) -> Self {//Self (大写) 当前类对象
        //self(小写) 当前对象
        let loadName = nibname == nil ? "\(self)" : nibname!
        let bundle = Bundle.init(for: self.classForCoder())//Bundle.init(for: type(of: self))
        return bundle.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}
