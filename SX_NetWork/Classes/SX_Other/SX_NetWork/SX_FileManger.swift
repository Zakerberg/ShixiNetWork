//
//  SX_FileManger.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 3/26/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

let CacheFilePath = NSHomeDirectory() + "/Documents/CacheFile/SX"

enum SXFileCacheTime : Int {
    case Minute  = 60
    case Hour    = 3600
    case Day     = 86400
    case Week    = 604800
    case Month   = 2592000
    case Forever = 0
}

class SX_FileManger: NSObject {
    
    /**
     * 写入文件
     **/
    class func witeToFile (fileName: NSString,content: NSString) -> Bool {
        let error : Bool
        let filePath = CacheFilePath + "/" + (fileName as String)
        let fileManager = FileManager.default
        if !(fileManager.fileExists(atPath: filePath)) {
            do{
                try fileManager.createDirectory(atPath: CacheFilePath, withIntermediateDirectories: true, attributes: nil)
            }
            catch { }
        }
        
        if !(error) {
            do {
                try content.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8.rawValue)
            }
            catch { }
            return true
        } else {
            return false
        }
    }
    
    /**
     *  文件的读取
     *
     *  return 返回字符串
     */
    class func readFile (fileName: NSString) -> NSString {
        
        
        
    }
    
    /**
     *  是否有缓存
     */
    class func isHasCacheFile (fileName: NSString,cacheData:SXFileCacheTime) -> Bool {
        
    }
    
    /**
     *  清除所有缓存文件
     */
    class func clearAllCacheFile -> Bool {
       
        
        
        
        
    }
    
    /**
     *  清除指定路径的缓存文件
     */
    class func deleteCacheFiles (filePath: NSString) -> Bool
    
    
    
    
    
    
}
