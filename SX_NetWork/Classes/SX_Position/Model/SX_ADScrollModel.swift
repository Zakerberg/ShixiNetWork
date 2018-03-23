//
//  SX_ADScrollModel.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 3/23/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

class SX_ADScrollModel: NSObject {
    
    var title:String = ""
    var pic_url = ""
    
    init(dic:[String:NSObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
      // print("undefined key : \(key), value : \(value)")
    }
}
