//
//  SX_PositionViewVC.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/17.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//  职位

import UIKit

class SX_PositionViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        self.navigationController?.isNavigationBarHidden = true
        configureScrollerView()
        
        
        
    }
    
    // MARK: - 轮播图
    func configureScrollerView() {
        
 
    }
  
    // MARK: - UITbaleViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
