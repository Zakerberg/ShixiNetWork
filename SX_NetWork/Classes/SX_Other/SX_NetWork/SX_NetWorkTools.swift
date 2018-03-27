//
//  SX_NetWorkTools.swift
//  SX_NetWork
//
//  Created by heather on 2018/1/22.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
// AFN 简单封装

import UIKit
import AFNetworking

enum SX_WorkToolMethod : String{
    
    case GET  = "get"
    case POST = "post"
}

class SX_NetWorkTools: AFHTTPSessionManager {

        static let shared:SX_NetWorkTools = {
            let tools = SX_NetWorkTools()
            tools.responseSerializer.acceptableContentTypes?.insert("text/html")
            tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
            return tools
        }()
        
        /// 网络请求公共方法
        ///
        /// - Parameters:
        ///   - method: 请求方式
        ///   - urlString: 请求url
        ///   - parameters: 请求参数
        ///   - success: 成功的闭包
        ///   - failure: 失败的闭包
    
        func request(method: SX_WorkToolMethod, urlString: String, parameters: Any?, success:@escaping (Any?)->(), failure:@escaping (Error)->()){
            // get请求
            if method == .GET {
                
                self.get(urlString, parameters: parameters, progress: nil, success: { (_, result) in
                    success(result)
                }, failure: { (_, error) in
                    failure(error)
                })
                
            }else {
                // post 请求
                self.post(urlString, parameters: parameters, progress: nil, success: { (_, result) in
                    success(result)
                }, failure: { (_, error) in
                    failure(error)
                })
            }
        }
    }
