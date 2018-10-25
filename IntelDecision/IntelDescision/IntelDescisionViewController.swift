//
//  IntelDescisionViewController.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/25.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit

class FilterModel: NSObject {
    var name = ""
    var id = ""
    
    convenience init(_ test:Bool) {
        self.init()
        name = "冰箱"
        id = "1"
    }
    
}

class IntelDescisionViewController: UIViewController {

    
    @IBOutlet var ibFilterView: UIView!
    @IBOutlet var ibFilterNameLabel: UILabel!
    var filterArray:Array<FilterModel> = []
    var dataArray:Array<IntelDesModel> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ibFilterView.layer.cornerRadius = 10
        ibFilterView.layer.masksToBounds = true
        
        ///test数据
        var i = 0
        while i < 10 {
            let filter = FilterModel.init(true)
            filterArray.append(filter)
            let mdel = IntelDesModel.init(true)
            dataArray.append(mdel)
            i = i+1
        }
    }
    
    @IBAction func ibaBackAction(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ibFilterAction(_ sender: Any) {
        let alertVC = UIAlertController.init(title: "", message: "", preferredStyle: .actionSheet)
        for filter in filterArray {
            let action = UIAlertAction.init(title: filter.name, style: .default) { (actionbt) in
                self.ibFilterNameLabel.text = actionbt.title
            }
            alertVC.addAction(action)
        }
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension IntelDescisionViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:IntelDesListViewCell = tableView.dequeueReusableCell(withIdentifier: "IntelDesListViewCell") as! IntelDesListViewCell
        let model = dataArray[indexPath.row]
        cell.model = model
        return cell
    }
}

extension IntelDescisionViewController:UITableViewDelegate
{
    
}
