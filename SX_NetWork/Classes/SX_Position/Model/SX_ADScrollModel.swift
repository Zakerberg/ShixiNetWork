//
//  SX_ADScrollModel.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 3/23/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

public protocol Mappable{
    init?(jsonData:JSON)
}

struct SX_ADScrollModel:  Mappable {
 
    let detail_url : String?
    let img_url : String?
    let ad_title : String?
    
    init?(jsonData: JSON) {
        
        self.detail_url = jsonData["detail_url"].string
        self.ad_title   = jsonData["ad_title"].string
        self.img_url    = jsonData["img_url"].string
    }
}
