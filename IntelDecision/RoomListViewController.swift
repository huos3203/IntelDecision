//
//  RoomListViewController.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/24.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit

/**
 为门店详情页面提供智能设备指标列表的UI插件
 
  - UI控件清单
    - UICollectionView
 */
class RoomListViewController: UIViewController {

    @IBOutlet var rootView: UIView!
    @IBOutlet var ibExampleButton: UIButton!
    
    @IBOutlet var collectionView: UICollectionView!
    
    var dataArray:Array<RoomStatusModel> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ///图例按钮画圆角
        ibExampleButton.layer.cornerRadius = 4

        testData()
    }
    
    ///点击浮动框显示指标图例
    @IBAction func ibaExampleAction(_ sender: Any) {
        //TODO: 点击浮动框显示指标图例
        
    }
    
    ///模拟UI数据
    func testData() {
        var i = 0
        while i<4 {
            let room = RoomStatusModel(test: true)
            dataArray.append(room)
            i = i + 1
        }
    }
}

/// 房间列表实现
extension RoomListViewController:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:RoomListCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomListCellView", for: indexPath) as! RoomListCellView
        let model:RoomStatusModel = self.dataArray[indexPath.row]
        cell.model = model
        return cell
    }
}
