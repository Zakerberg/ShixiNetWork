//
//  SX_PositionViewVC.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/17.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//  职位

import UIKit
import ObjectMapper
import RxSwift
import SwiftyJSON
import MJExtension

let HotRecruitCell        = "HotRecruitCell"
let HotIndustryCell       = "HotIndustryCell"
let HotRecommrndationCell = "HotRecommrndationCell"
let HotPositionCell       = "HotPositionCell"

class SX_PositionViewVC: UIViewController {
    
    let adScrollView = SX_ADScrollerView(Y: 0, H: 200)
    var adModel:SX_ADScrollModel!
    //    var adModelArr = [SX_ADScrollModel]()
    let  disposeBag = DisposeBag()
    var homeTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        fetchADData()
        judgeAppVersion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - SetUI
extension SX_PositionViewVC {
    func setUI() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.homeTableView = UITableView(frame: self.view.frame, style: .grouped)
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        self.view.addSubview(self.homeTableView)
        self.homeTableView.addSubview(adScrollView)
    }
}

//MARK: - 首页轮播图
extension SX_PositionViewVC {
    func fetchADData() {
        
        SX_HomeAPI.request(target: .URL_Position_ScrollAD, success: { (result) in
            SXLog(result)
            guard let adModel = SX_ADScrollModel(JSON: (result as! [String : AnyObject])) else { return }
            
            self.adModel = adModel
            
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
            
        }) { (error) in
            SXLog(error.localizedDescription)
        }
    }
}

//MARK: - UIScrollerViewDelagate
extension SX_PositionViewVC {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let offSetY = scrollView.contentOffset.y
    }
}

//MARK: - UITableViewDelagate
extension SX_PositionViewVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 270
        } else if indexPath.section == 1 {
            return 180
        } else if indexPath.section == 2 {
            return 90
        } else {
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 230
        } else if section == 3 {
            return 30
        } else {
            return 45
        }
    }
}


//MARK: - judgeAppVersion
func judgeAppVersion() {
    let localVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! NSString
    do {
        _ = NSError()
        var response = try NSURLConnection.sendSynchronousRequest(URLRequest(url: URL(fileURLWithPath: "https://itunes.apple.com/cn/lookup?id=1044254573")), returning: nil)
        if response == nil {
            print("没连接网络")
            return
        }
        
        let appInfoDic = try JSONSerialization.jsonObject(with: response, options: .mutableLeaves) as! NSDictionary
        print(appInfoDic)
        let array = appInfoDic["results"] as! NSArray
        if array.count < 1 {
            print("此App未提交")
            return
        }
        let dic = array[0] as! NSDictionary
        let appStoreVersion = dic["version"]
        print("当前版本号\(localVersion),商店版本号\(String(describing: appStoreVersion))")
        
    } catch { }
}


