//
//  IntelDescisionView.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/25.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit
import OHHTTPStubs

class IntelDescisionView: UIView {
    
    @IBOutlet var ibExampleButton: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet var collectionView: UICollectionView!
    var zhezView:UIView!
    
    var dataArray:Array<RoomStatusModel> = []
    var tuliArr:Array<DecisionModel> = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Do any additional setup after loading the view.
        ///图例按钮画圆角
        ibExampleButton.layer.cornerRadius = 4
        ///宽度自适应设置
        let layout:UICollectionViewFlowLayout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize.init(width:200, height: 100)
        
        let bundle = OHResourceBundle("source", type(of: self))
        let img = UIImage.init(named: "background", in: bundle, compatibleWith: nil)
        let imageView = UIImageView.init(image: img)
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.backgroundView = imageView
        self.tableView.isHidden = true
        
        //浮动层隔离点击事件
        let window = (UIApplication.shared.delegate?.window)!
        zhezView = UIView.init(frame: (window?.bounds)!)
        zhezView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(IntelDescisionView.tapGestureAction(_:)))
        tap.numberOfTapsRequired = 1
        zhezView.addGestureRecognizer(tap)
        zhezView.isHidden = true
        window?.addSubview(zhezView)
        tableView.isHidden = false
        zhezView.addSubview(tableView)
        
        testData()
    }
    
    func refreshView() {
        self.collectionView.reloadData()
        self.tableViewHeight.constant = self.tableView.contentSize.height
    }
    
    ///点击浮动框显示指标图例
    @IBAction func ibaExampleAction(_ sender: Any) {
        //TODO: 点击浮动框显示指标图例
        self.showTulistView()
    }
    
    ///模拟UI数据
    func testData() {
        var i = 0
        while i<4 {
            let room = RoomStatusModel(test: true)
            dataArray.append(room)
            let tuli = DecisionModel.init(test: true)
            tuliArr.append(tuli)
            i = i + 1
        }
    }
}

//MARK: - 房间列表
/// 房间列表实现
extension IntelDescisionView:UICollectionViewDataSource
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

//MARK: - 图例列表
/// 图例
extension IntelDescisionView:UITableViewDataSource{
    
    func showTulistView() {
        zhezView.isHidden = !zhezView.isHidden
        /// 图例依附按钮浮动框位置
        let rect = ibExampleButton.convert(ibExampleButton.center, to: zhezView)
        let x = tableView.frame.size.width/2 - 10
        let y = rect.y
        let tabrect = CGRect.init(origin: CGPoint.init(x: x, y: y), size: tableView.frame.size)
        tableView.frame = tabrect
    }
    
    @objc func tapGestureAction(_ tapGesture:UITapGestureRecognizer) {
        //隐藏
        zhezView.isHidden = true
    }
    
    //MARK: tableview代理
    ///图例列表
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tuliArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TuliCell = tableView.dequeueReusableCell(withIdentifier: "TuliCell") as! TuliCell
        let model = tuliArr[indexPath.row]
        cell.model = model
        return cell
    }
}

class TuliCell: UITableViewCell {
    @IBOutlet var icon:UIImageView!
    @IBOutlet var name:UILabel!
    var newModel:DecisionModel!
    var model:DecisionModel{
        set(newValue){
            newModel = newValue
            name.text = newValue.value
            let bundle = OHResourceBundle("source", type(of: self))
            icon.image = UIImage.init(named: newValue.icon, in: bundle, compatibleWith: nil)
        }
        get{
            return newModel
        }
    }
}

