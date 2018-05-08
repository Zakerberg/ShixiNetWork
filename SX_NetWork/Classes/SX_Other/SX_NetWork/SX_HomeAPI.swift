//
//  SX_HomeAPI.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 5/8/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
// 首页API

import UIKit
import Moya

enum API {
    case URL_Position_EnNewsList
    case URL_Position_NewsList(para1:String,para2:String)
}

extension API:TargetType {
    
    // 定义每个接口的http请求
    var method: Moya.Method {
        switch self {
        case .URL_Position_EnNewsList:
            return .get
        default:
            return .post
        }
    }
    
    // 定义每个接口的test数据
    public var sampleData: Data {
        return Data()
    }
    
    // 定义每个接口的 task
    var task: Task {
        switch self {
        case .URL_Position_NewsList:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        case .URL_Position_EnNewsList:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    // 定义每个接口的请求头
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return URL.init(string: "http://shixi.com")!
    }
    
    //不同接口的子路径
    var path: String {
        switch self {
        case .URL_Position_NewsList:
            return "/apphome/index"
        case .URL_Position_EnNewsList:
            return "/apphome/indexen"
        }
    }
}
