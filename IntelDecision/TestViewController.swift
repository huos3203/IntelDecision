//
//  TestViewController.swift
//  jinher.app.IntelDecision
//
//  Created by admin on 2018/10/25.
//  Copyright © 2018年 clcw. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var viewdd: UIView!
    var rootView:IntelDescisionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let roomlist:RoomListViewController = self.storyboard?.instantiateViewController(withIdentifier: "RoomListViewController") as! RoomListViewController
        let _ = roomlist.view
        rootView = roomlist.rootView
        rootView.frame.origin = CGPoint.init(x: 300, y: 200)
        viewdd.addSubview(roomlist.rootView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rootView.refreshView()
    }
}
