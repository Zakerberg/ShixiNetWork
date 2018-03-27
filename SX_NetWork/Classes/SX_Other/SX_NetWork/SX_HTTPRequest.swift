//
//  SX_HTTPRequest.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 3/26/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit
import AFNetworking

enum HttpRequestCachePolicy : NSInteger {
    case `default` = 0             // 只请求数据，不缓存数据
    case ReloadIgnoringCache      // 忽略缓存，重新请求
    case ReturnCacheDataThenLoad  // 有缓存先返回缓存，同步请求数据
    case ReturnCacheDataElseLoad  // 有缓存用缓存，无缓存重新请求(用于数据不变时)
    case ReturnCacheDataDontLoad  // 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理(用于离线模式)
}

class SX_HTTPRequest: NSObject {
    
    /// 请求成功Closure
    typealias HttpRequestSuccessClosure = ((_ responseData: Any) -> ())?
    /// 请求失败的Closure
    typealias HttpRequestFailClosure = ((_ Error: NSError) -> ())?
    /// 请求响应Closure
    typealias HttpRequestClosure = ((_ dataObj: Any, _ error: NSError) -> ())?
    /// 监听进度响应Closure
    typealias HttpProgressClosure = ((_ progress: Progress) -> ())?
    
    var timeOutInterval = TimeInterval()
    
    /// 移除所有缓存
    class func removeAllCaches () {
        
        
    }
    
    /// 取消所有网络请求
    class func cancelAllOperations () {
        

    }
    
    
    class func setHeader(handler:((_ requestSerializer: AFHTTPRequestSerializer) -> ())) {
        
    }
    
    /// AFN 参数加在AFMultipartFormData --用于表参数
    class func POSTWithFormData (url: NSString, params: NSDictionary, constructingBodyClosure:((_ formData : Any,AFMultipartFormData) -> ()), cachePolicy: HttpRequestCachePolicy, successHandler: HttpRequestSuccessClosure, failure: HttpRequestFailClosure) {
    }
    
    /// 用系统的网络请求 把参数加在dody里
    class func POSTWithData (URLString: NSString, params: NSDictionary, data: NSData, success: ((_ success: NSDictionary) -> ()), faliure: ((_ faliure: NSError) -> ())) {
    
    }
    
    /// AFN 表单上传图片
    class func UploadImageWithUrl (URLString: NSString, params: NSDictionary, image: UIImage, success:((_ success: NSDictionary) -> ()), faliure: ((_ faliure: NSError) -> ())) {
        

    }
}

//MARK: - GET请求
extension SX_HTTPRequest {
    
    /**
     *  GET请求 -> 默认只请求数据，不做缓存。HttpRequestDefault方式
     *
     *  param url            请求路径
     *  param params         请求参数
     *  param successHandler 请求成功后的回调
     *  param failureHandler 请求失败后的回调
     */
    class func GET (url: NSString, params: NSDictionary) {
        
    }
    
}

//MARK: - POST请求
extension SX_HTTPRequest {
    
    /**
     *  POST请求 -> 默认只请求数据，不做缓存。HttpRequestDefault方式
     *
     *  param url            请求路径
     *  param params         请求参数
     *  param successHandler 请求成功后的回调
     *  param failureHandler 请求失败后的回调
     */
    class func POST (url: NSString, params: NSDictionary) {
        
        
        
        
        
    }

}





