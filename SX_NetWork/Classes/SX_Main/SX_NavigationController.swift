//
//  SX_NavigationController.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/15.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

class SX_NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SX_NavigationController.setNavBarTheme()
        SX_NavigationController.setupBarButtonItemTheme()
    }
    
    // MARK: - setNavBarTheme
    class func setNavBarTheme() {
        
        let apprance : UINavigationBar = UINavigationBar.appearance()
        apprance.tintColor = UIColor.white
        apprance.setBackgroundImage(UIImage.imageWithColor(color: UIColor.SX_MainColor(), size: CGSize.init(width: 1.0, height: 1.0)), for: .any, barMetrics: .default)
        apprance.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,
             NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        apprance.shadowImage = UIImage.imageWithColor(color: UIColor.colorWithHexString(hex: "dcdcdc", alpha: 1.0), size: CGSize.init(width: 0.6, height: 0.6))
    }
    
    // MARK: - setupBarButtonItemTheme
    class func setupBarButtonItemTheme() {
        
        let apprance: UIBarButtonItem = UIBarButtonItem.appearance()
        apprance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], for: .normal)
        apprance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], for: .selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
