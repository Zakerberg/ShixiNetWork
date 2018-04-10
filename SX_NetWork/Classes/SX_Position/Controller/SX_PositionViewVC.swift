//
//  SX_PositionViewVC.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/17.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//  职位

import UIKit

let HotRecruitCell        = "HotRecruitCell"
let HotIndustryCell       = "HotIndustryCell"
let HotRecommrndationCell = "HotRecommrndationCell"
let HotPositionCell       = "HotPositionCell"

class SX_PositionViewVC: UIViewController {
    
    let adScrollView = SX_ADScrollerView(Y: 0, H: 200)
    var modelArr = [SX_ADScrollModel]()
    var dataArrM = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // fetchADData()
        // judgeAppVersion()
        
    }
    
    func judgeAppVersion() {
        var localVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! NSString
    
        do {
            
            _ = NSError()
            let response = try NSURLConnection.sendSynchronousRequest(URLRequest(url: URL(fileURLWithPath: "https://itunes.apple.com/cn/lookup?id=1044254573")), returning: nil)
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
            print("当前版本号\(localVersion),商店版本号\(appStoreVersion)")
         
        } catch { }
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
        self.view.addSubview(adScrollView)
    }
}

//MARK: - 首页轮播图
extension SX_PositionViewVC {
    func fetchADData() {
        
        SX_NetWorkTools.shared.request(method: .POST, urlString: URL_Position_ScrollAD, parameters: nil, success: { (responseObj : Any) in
            guard let dataDic = responseObj as? [String : NSObject] else { return }
            guard let dataArr = dataDic["data"] as? [[String : NSObject]] else { return }
            for dic in dataArr{
                self.modelArr.append(SX_ADScrollModel(dic : dic))
            }
            self.adScrollView.adScrollModelArr = self.modelArr
        }) { (error : Error) in
            print(" 失败 : \(error)")
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
        return self.dataArrM.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arr = self.dataArrM[section]
        if section == 3 {
            return (arr as AnyObject).count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            
            
            break
        case 1:
            
            
            
            
            break
        case 2:
            
            
            
            break
        case 3:
            
            
            
            break
        default:
            
            break
        }
        
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



