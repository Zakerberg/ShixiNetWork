//
//  SX_PositionViewVC.swift
//  SX_NetWork
//
//  Created by Micahel 柏 on 2018/1/17.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//  职位

import UIKit

class SX_PositionViewVC: UIViewController {
    
    // let adScrollView = SX_ADScrollerView(Y: 64, H: 200)需要毛玻璃效果时Y为64
    let adScrollView = SX_ADScrollerView(Y: 0, H: 200)
    var modelArr = [SX_ADScrollModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - SetUI
extension SX_PositionViewVC {
    func setUI() {
        self.view.backgroundColor = UIColor.green
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(adScrollView)
    }
}

//MARK: - UITableViewDelagate
extension SX_PositionViewVC : UITableViewDelegate {
    
    
    
}

//MARK: - UITbaleViewDataSource
//extension SX_PositionViewVC : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//    }
//}

//MARK: - FetchData
extension SX_PositionViewVC {
    func fetchData() {
        SX_NetWorkTools.shared.request(method: .POST, urlString: URL_Position_ScrollAD, parameters: nil, success: { (responseObj : Any) in
            guard let dataDic = responseObj as? [String : NSObject] else{ return }
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
