//
//  SX_ResumeViewVC.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/17.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

class SX_ResumeViewVC: UIViewController {
    
    //fileprivate lazy var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.SX_MainColor()
        
        let button = UIButton(type: .custom)
        button.rx.tap.subscribe { (event) in
            print("按钮的点击")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
