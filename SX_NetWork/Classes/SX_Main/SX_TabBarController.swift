//
//  SX_TabBarController.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/16.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

class SX_TabBarController: UITabBarController {
    
    static let SX_PositionViewVC : NSString = "SX_PositionViewVC"
    static let SX_ResumeViewVC   : NSString = "SX_ResumeViewVC"
    static let SX_MineCenterVC   : NSString = "SX_MineCenterVC"
    static var SX_TabbarTitle    : NSString = "SX_TabbarTitle"
    static let SX_TabbarImage    : NSString = "SX_TabbarImage"
    static let SX_TabbarSelectedImage  : NSString = "SX_TabbarSelectedImage"
    static let SX_TabbarItemBadgeValue : NSString = "SX_TabbarItemBadgeValue"
    
    var vcsOrder : NSArray {
        get{
            return [SX_TabBarController.SX_PositionViewVC,SX_TabBarController.SX_ResumeViewVC,SX_TabBarController.SX_MineCenterVC]
        }
    }
    
    var vcsInfoDict : NSDictionary {
        get{
            return [
                SX_TabBarController.SX_PositionViewVC : [
                    SX_TabBarController.SX_TabbarTitle : "职位",
                    SX_TabBarController.SX_TabbarImage : "Position",
                    SX_TabBarController.SX_TabbarSelectedImage : "Position_highlighted",
                    SX_TabBarController.SX_TabbarItemBadgeValue : 0
                ],
                
                SX_TabBarController.SX_ResumeViewVC : [
                    SX_TabBarController.SX_TabbarTitle : "简历",
                    SX_TabBarController.SX_TabbarImage : "Resume",
                    SX_TabBarController.SX_TabbarSelectedImage : "Resume_highlighted",
                    SX_TabBarController.SX_TabbarItemBadgeValue : 0
                ],
                
                SX_TabBarController.SX_MineCenterVC : [
                    SX_TabBarController.SX_TabbarTitle : "我的",
                    SX_TabBarController.SX_TabbarImage : "Mine",
                    SX_TabBarController.SX_TabbarSelectedImage : "Mine_highlighted",
                    SX_TabBarController.SX_TabbarItemBadgeValue : 0
                ]
            ]
        }
    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = CGFloat(kTabBarHeight)
        tabFrame.origin.y = self.view.frame.size.height - CGFloat(kTabBarHeight)
        self.tabBar.frame = tabFrame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubVCs()
    }
    
    func setupSubVCs() {
        self.vcsOrder.enumerateObjects { (vcName, index, stop) in
            
            let vcInfo: NSDictionary = self.vcsInfoDict.object(forKey: vcName) as! NSDictionary
            guard let spaceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
                print("获取命名空间失败!")
                return
            }
            let vcClass: AnyClass? = NSClassFromString(spaceName + ".\(vcName)")
            guard let typeClass = vcClass as? UIViewController.Type else{
                print("vcClass不能当做UIViewController!")
                return
            }
            let vc = typeClass.init()
            vc.title = vcInfo[SX_TabBarController.SX_TabbarTitle] as! NSString as String
            vc.tabBarItem.image = UIImage.init(named: vcInfo[SX_TabBarController.SX_TabbarImage] as! NSString as String)
            let SelectedImage = UIImage.init(named: vcInfo[SX_TabBarController.SX_TabbarSelectedImage] as! NSString as String)
            vc.tabBarItem.selectedImage = SelectedImage
            vc.tabBarItem .setTitleTextAttributes([NSAttributedStringKey(rawValue: kCIAttributeName) : UIColor.SX_MainColor()], for: .selected)
            
            let nav = SX_NavigationController(rootViewController: vc)
            self.addChildViewController(nav)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
