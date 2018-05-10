//
//  SX_HomeAPI.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 5/8/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
// 首页API

import UIKit
import Moya

struct  SX_HomeAPI {
    
    typealias successCallback = (_ result: Any)      -> Void
    typealias failureCallback = (_ error: MoyaError) -> Void
    
    static let SXHomeProvider = MoyaProvider<HomeAPI>()
    static func request(
        target: HomeAPI,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ){
        
        SXHomeProvider.request(target){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success(moyaResponse.mapJSON()) // 测试用JSON数据
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                failure(error)
                
            }
        }
    }
}

enum HomeAPI {
    case URL_Position_EnNewsList
    case URL_Position_NewsList
    case URL_Position_ScrollAD
}

extension HomeAPI : TargetType {
    
    // 定义每个接口的http请求
    var method: Moya.Method {
        switch self {
        case .URL_Position_EnNewsList:
            return .post
        default:
            return .get
        }
    }
    
    // 定义每个接口的 task
    var task: Task {
        switch self {
        case .URL_Position_NewsList:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        case .URL_Position_EnNewsList:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .URL_Position_ScrollAD:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
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
        case .URL_Position_ScrollAD:
            return "/appad"
        }
    }
    
    //是否执行Alamofire验证
    public var validate: Bool{
        return false
    }
    
    // 定义每个接口的test数据
    public var sampleData: Data {
        return "{}".utf8Encoded
    }
    
    // 定义每个接口的请求头
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}

private extension String {
    var utf8Encoded: Data{
        return data(using: .utf8)!
    }
}

