//
//  FullAlertListView.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/26.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit
import OHHTTPStubs

class AlertlistModel: NSObject {
    var name = ""
    var id = ""
}
class AlertListFullView: UIView,NibLoadable {
    
    var dataArray:Array<AlertlistModel> = []
    var handler:((AlertlistModel)->Void)!
    var tableView: UITableView!

    convenience init(_ fullScreen:Bool){
        let window = (UIApplication.shared.delegate?.window)!
        self.init(frame: (window?.bounds)!)
        //浮动层隔离点击事件
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(AlertListFullView.tapGestureAction(_:)))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isHidden = true
        window?.addSubview(self)
        
        tableView = UITableView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: 70, height: 80)))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"AlertlistViewCell")
        tableView.isHidden = false
        
        let bundle = OHResourceBundle("source", type(of: self))
        let img = UIImage.init(named: "smallxialabg", in: bundle, compatibleWith: nil)
        /**
         // 按4边间距显示不拉伸的区域
         顶端盖高度:40
         底端盖高度 10
         左端盖宽度 10
         右端盖宽度 10
         */
//        let edge = UIEdgeInsets.init(top:10, left: 10, bottom: 10, right: 10)
//        img = img?.resizableImage(withCapInsets: edge, resizingMode: .tile)
        let imageView = UIImageView.init(image: img)
        imageView.frame = tableView.bounds
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = imageView
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        
        
        self.addSubview(tableView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

//MARK: - 图例列表
/// 图例
extension AlertListFullView:UITableViewDataSource,UITableViewDelegate{
    
    open func showlistView(target:UIView, alertData:Array<AlertlistModel>, handler:@escaping (AlertlistModel)->Void) {
        self.dataArray = alertData
        self.handler = handler
        self.isHidden = !self.isHidden
        /// 图例依附按钮浮动框位置
        let rect = target.convert(target.center, to: self)
        let x = rect.x - 25
        let y = rect.y + 10
        let tabrect = CGRect.init(origin: CGPoint.init(x: x, y: y), size: tableView.frame.size)
        tableView.frame = tabrect
    }
    
    @objc func tapGestureAction(_ tapGesture:UITapGestureRecognizer) {
        //隐藏
        self.isHidden = true
    }
    
    //MARK: tableview代理
    ///图例列表
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "AlertlistViewCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "AlertlistViewCell")
            cell?.backgroundColor = UIColor.clear
        }
        let model = self.dataArray[indexPath.row]
        cell?.detailTextLabel?.text = model.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        let model = self.dataArray[indexPath.row]
        self.handler(model)
    }
    
}
