//
//  RoomListViewController.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/24.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit
import OHHTTPStubs

/**
 为门店详情页面提供智能设备指标列表的UI插件
 
  - UI控件清单
    - UICollectionView
 */
class RoomListViewController: UIViewController {

    @IBOutlet var rootView: IntelDescisionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = OHResourceBundle("source", type(of: self))
        var img = UIImage.init(named: "smallxialabg", in: bundle, compatibleWith: nil)
        /**
         // 按4边间距显示不拉伸的区域
         顶端盖高度:40
         底端盖高度 10
         左端盖宽度 10
         右端盖宽度 10
         */
        let edge = UIEdgeInsets.init(top:10, left: 10, bottom: 10, right: 10)
        img = img?.resizableImage(withCapInsets: edge, resizingMode: .tile)
        let imageView = UIImageView.init(image: img)
        imageView.frame.size = CGSize.init(width: 80, height: 100)
        imageView.frame.origin.y = 100
        self.view.addSubview(imageView)
        
        let img2 = UIImage.init(named: "background", in: bundle, compatibleWith: nil)
        let imageView2 = UIImageView.init(image: img2)
        imageView2.frame.origin.y = 100
        imageView2.frame.origin.x = 200
        self.view.addSubview(imageView2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootView.refreshView()
    }
}
