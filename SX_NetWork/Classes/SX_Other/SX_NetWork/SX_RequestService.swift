//
//  SX_RequestService.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 3/28/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit
import AFNetworking
import MJExtension

class SX_RequestService: NSObject {
    
    /// 请求成功的Handler
    typealias SXRequestSuccessHandler = ((_ responseData: Any) -> ())
    /// 请求失败的Handler
    typealias SXRequestFailureHandler = ((_ error: NSError) -> ())
    
    /**
     *  设置请求头
     *
     *  param headerKV  请求头Key-Value
     */
    class func setHeader (headerKV: NSDictionary) {
        SX_HTTPRequest.setHeader { (requsetSerializer: AFHTTPRequestSerializer) in
            for key in headerKV.allKeys {
                requsetSerializer.setValue(headerKV.value(forKey: key as! String) as? String, forHTTPHeaderField: key as! String)
            }
        }
    }
    
    // 此处设置请求头
    class func setReqHeader() {
        
    }
}

//MARK: - GET
extension SX_RequestService {
    /**
     *  GET请求       -> 需要自己做模型转换操作
     *
     *  param url       请求地址
     *  param param     请求参数 ->字典 或 模型
     *  success         请求成功回调
     *  failure         请求失败回调
     */
    class func GET (url: NSString, param: Any, success: @escaping SXRequestSuccessHandler, failure: @escaping SXRequestFailureHandler) {
        let paramsJSON = (param as AnyObject).mj_JSONObject()
        setReqHeader()
        
        SX_HTTPRequest.GET(url: url, params: paramsJSON as! NSDictionary, successHandler: { (respondeData: Any) in
            print("GET: \(url) --> 请求成功, 响应结果-->\(respondeData)")
            
            success(respondeData)
            
        }) { (error: NSError) in
            print("GET: \(url) --> 请求失败, 错误结果-->\(error)")
            let data = error.userInfo["com.alamofire.serialization.response.error.data"]
            let str = NSString(data: data as! Data, encoding: String.Encoding.utf8.rawValue)
            print("服务器的错误原因:\(String(describing: str))")
            
            failure(error)
        }
    }
}

//MARK: - POST
extension SX_RequestService {
    /**
     *  POST请求    -> 需要自己做模型转换操作
     *
     *  param url     请求地址
     *  param param   请求参数 ->字典 或 模型
     *  success       请求成功回调
     *  failure       请求失败回调
     */
    class func POST (url: NSString, param: Any, success: SXRequestSuccessHandler, failure: SXRequestFailureHandler) {
        

    }
}

