//
//  AddIntelDesViewController.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/26.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit

class AddIntelDesViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    ///返回
    @IBAction func ibaBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    ///保存内容
    @IBAction func ibaSaveAction(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
