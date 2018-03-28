//
//  SX_HTTPRequest.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 3/26/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit
import AFNetworking
import MJExtension

enum HttpRequestCachePolicy : NSInteger {
    case Default = 0             // 只请求数据，不缓存数据
    case ReloadIgnoringCache      // 忽略缓存，重新请求
    case ReturnCacheDataThenLoad  // 有缓存先返回缓存，同步请求数据
    case ReturnCacheDataElseLoad  // 有缓存用缓存，无缓存重新请求(用于数据不变时)
    case ReturnCacheDataDontLoad  // 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理(用于离线模式)
}

enum HttpRequestType : NSInteger {
    case GET = 0
    case POST
}

let kTimeOutInvertral : CGFloat = 30.0

class SX_HTTPRequest: NSObject {
    
    /// 请求成功Closure
    typealias HttpRequestSuccessClosure = ((_ responseData: Any) -> ())?
    /// 请求失败的Closure
    typealias HttpRequestFailClosure    = ((_ Error: NSError) -> ())?
    /// 请求响应Closure
    typealias HttpRequestClosure        = ((_ dataObj: Any, _ error: NSError) -> ())?
    /// 监听进度响应Closure
    typealias HttpProgressClosure       = ((_ progress: Progress) -> ())?
    
    let timeOutInterval = TimeInterval()
    var sessionManager : AFHTTPSessionManager!
    
    override init() {
        
        // 1. 创建SessionManager
        self.sessionManager = AFHTTPSessionManager()
        self.sessionManager.securityPolicy = AFSecurityPolicy(pinningMode: .none)
        
        self.sessionManager.requestSerializer = AFHTTPRequestSerializer()
        self.sessionManager.responseSerializer = AFJSONResponseSerializer()
        
        self.sessionManager.requestSerializer.timeoutInterval = TimeInterval(kTimeOutInvertral)
        self.sessionManager.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/html", "text/plain") as? Set<String>
    }
    
    class func setHeader(handler:((_ requestSerializer: AFHTTPRequestSerializer) -> ())) {
        let requestSerializer = SX_HTTPRequest.shared.sessionManager.requestSerializer
        handler(requestSerializer)
    }
    
    static let shared:SX_HTTPRequest = {
        let instance = SX_HTTPRequest()
        return instance
    }()
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
    class func GET (url: NSString, params: NSDictionary, successHandler: HttpRequestSuccessClosure, failureHandler: HttpRequestFailClosure) {
        
        
        
        
        
    }
    
    /**
     *  GET请求
     *
     *  param URL            请求路径
     *  param params         请求参数
     *  param cachePolicy    缓存策略
     *  param successHandler 请求成功后的回调
     *  param failureHandler 请求失败后的回调
     */
    class func GET (URL: NSString, params: NSDictionary, successHandler: HttpRequestSuccessClosure, failureHandler: HttpRequestFailClosure){
        
        
        
        
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
    class func POST (url: NSString, params: NSDictionary, successHandler: HttpRequestSuccessClosure, failureHandler: HttpRequestFailClosure) {
        
        
        
    }
    
    /**
     *  POST请求
     *
     *  param URL            请求路径
     *  param params         请求参数
     *  param cachePolicy    缓存策略
     *  param successHandler 请求成功后的回调
     *  param failureHandler 请求失败后的回调
     */
    class func POST (URL: NSString,params: NSDictionary, cachePolicy: HttpRequestCachePolicy, successHandler: HttpRequestSuccessClosure, failureHandler: HttpRequestFailClosure) {
        
    }
}

//MARK: - AFN 表单上传图片
extension SX_HTTPRequest {
    class func UploadImageWithUrl (URLString: NSString, params: NSDictionary, image: UIImage, success:((_ success: NSDictionary) -> ()), faliure: ((_ faliure: NSError) -> ())) {
        
    }
}

//MARK: - AFN 参数加在AFMultipartFormData -- 用于表参数
extension SX_HTTPRequest {
    class func POSTWithFormData (url: NSString, params: NSDictionary, constructingBodyClosure:((_ formData : Any,AFMultipartFormData) -> ()), cachePolicy: HttpRequestCachePolicy, successHandler: HttpRequestSuccessClosure, failure: HttpRequestFailClosure) {
    }
}

//MARK: - 用系统的网络请求 把参数加在dody里
extension SX_HTTPRequest {
    class func POSTWithData (URLString: NSString, params: NSDictionary, data: NSData, success: ((_ success: NSDictionary) -> ()), faliure: ((_ faliure: NSError) -> ())) {
        
    }
}

//MARK: - 移除所有缓存 && 取消所有网络请求
extension SX_HTTPRequest {
    /// 移除所有缓存
    class func removeAllCaches () {
        SX_FileManger.clearAllCacheFile()
    }
    
    /// 取消所有网络请求
    class func cancelAllOperations () {
        SX_HTTPRequest.shared.sessionManager.operationQueue.cancelAllOperations()
    }
}

extension SX_HTTPRequest {
    class func requestMethod (requestType:HttpRequestType, cachePolicy: HttpRequestCachePolicy, url: NSString, params: NSDictionary, successHandler: HttpRequestSuccessClosure, failureHandler: HttpRequestFailClosure) {
        
        if SX_HTTPRequest.shared.timeOutInterval > 0 {
            SX_HTTPRequest.shared.sessionManager.requestSerializer.timeoutInterval = SX_HTTPRequest.shared.timeOutInterval
        }
        
        // Default、ReloadIgnoringCache 这两种策略始终都发送请求
        // *********** 其他三种策略，读取本地缓存 ***********
        if cachePolicy == .ReturnCacheDataThenLoad || cachePolicy == .ReturnCacheDataElseLoad || cachePolicy == .ReturnCacheDataDontLoad {
            
            let dataStr = SX_FileManger.readFile(fileName: url.md5)
            let dataObj: Any = dataStr.mj_JSONData()
            
            switch cachePolicy {
            case .ReturnCacheDataThenLoad: // 先返回缓存，同时请求
                successHandler!(dataObj)
                
                break
            case .ReturnCacheDataElseLoad: // 有缓存就返回缓存，没有就请求
                successHandler!(dataObj)
                
                return
            case .ReturnCacheDataDontLoad: // 有缓存就返回缓存,从不请求（用于没有网络）
                successHandler!(dataObj)
                
            return // 退出从不请求
            case .Default:
                
                break
            case .ReloadIgnoringCache:
                
                break
            }
        }
        
        /// *********** 发送请求 ***********
        switch requestType {
            
        /// GET 请求
        case .GET:
            SX_HTTPRequest.shared.sessionManager.get(url as String, parameters: params, success: { (task: URLSessionDataTask!, responseObject: Any) in
                
                if (successHandler != nil) {
                    if (cachePolicy != .Default && responseObject != nil)  {
                        SX_FileManger.witeToFile(fileName: url.md5, content: responseObject as! NSString)
                    }
                }
            }, failure: { (task: URLSessionDataTask!, error: NSError) in
                failureHandler!(error)
                } as? (URLSessionDataTask?, Error) -> Void)
            
            break
        /// POST 请求
        case .POST:
            SX_HTTPRequest.shared.sessionManager.post(url as String, parameters: params, success: { (task: URLSessionDataTask!, responseObject: Any) in
                
                if (successHandler != nil) {
                    if(cachePolicy != .Default && responseObject != nil){
                        SX_FileManger.witeToFile(fileName: url.md5, content: responseObject as! NSString)
                    }
                }
                
            }, failure: { (task: URLSessionDataTask!, error: NSError) in
                failureHandler!(error)
                } as! (URLSessionDataTask?, Error) -> Void)
            break
            
        default:
            
            break
        }
    }
}




