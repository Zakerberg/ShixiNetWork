//
//  SX_BaseResponse.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 5/8/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import ObjectMapper

public class SX_BaseResponse: Mappable {
    
    var code: Int = -1
    var message: String = ""
   
    public init() {}
    public required init?(map: Map) {}
    public  func mapping(map: Map) {
        code     <- map["code"]
        message  <- map["message"]
    }
}





