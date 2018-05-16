//
//  SX_GuideViewController.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/15.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//  引导页面

import UIKit
import SnapKit

class SX_GuideViewController: UIViewController,UIScrollViewDelegate {
    
    let NEWVIEWCONT : CGFloat = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        addScrroller() 
    }
    
    func addScrroller() {
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: NEWVIEWCONT*(self.view.frame.size.width), height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        let w  = self.view.bounds.size.width
        let h  = self.view.bounds.size.height
        
        for index in 0...3 {
            let imageView = UIImageView()
            imageView.isUserInteractionEnabled = true
            let x = index * Int(w)
            imageView.frame = CGRect(x: CGFloat(x), y: 0, width: w, height: h)
            let imageName = NSString.init(format: "引导页-\(index + 1)" as NSString)
            imageView.image = UIImage.init(named: imageName as String)
            scrollView.addSubview(imageView)
            
            if Int(index) == Int((NEWVIEWCONT - 1)) {
                if Int(index) == 2 {
                    
                    let button = UIButton(type: .custom)
                    button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
                    button.setTitle("立即体验", for: .normal)
                    button.setTitleColor(UIColor.SX_MainColor(), for: .normal)
                    imageView.addSubview(button)
                    button.snp.makeConstraints({ (SX) in
                        SX.bottom.equalTo(imageView.snp.bottom).offset(-50)
                        SX.centerX.equalToSuperview()
                        SX.left.equalTo(imageView.snp.left).offset(40)
                        SX.top.equalTo(imageView.snp.top).offset(358/2)
                    })
                }
                scrollView.addSubview(imageView)
            }
        }
        self.view.addSubview(scrollView)
    }

    // MARK: - 立即体验按钮
    @objc func buttonClick(btn: UIButton) {
        let usderDefaults = UserDefaults.standard
        let userLoginVC = SX_TabBarController()
        self.view.window?.rootViewController = userLoginVC
        usderDefaults.setValue("yes", forKey: "isVisitor")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
