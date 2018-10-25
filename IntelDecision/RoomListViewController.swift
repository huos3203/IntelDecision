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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootView.refreshView()
    }
}
