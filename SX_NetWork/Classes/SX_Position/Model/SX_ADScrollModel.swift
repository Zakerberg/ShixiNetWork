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

class SX_ADScrollModel:  Mappable {
 
    var detail_url: String = ""
    var img_url: String = ""
    var ad_title: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        detail_url    <-  map["detail_url"]
        img_url       <-  map["img_url"]
        ad_title      <-  map["ad_title"]
    }
}
