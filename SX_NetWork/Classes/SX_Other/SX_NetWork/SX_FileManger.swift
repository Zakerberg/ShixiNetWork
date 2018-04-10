////
////  SX_FileManger.swift
////  SX_NetWork
////
////  Created by Michael 柏 on 3/26/18.
////  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
////
//
//import UIKit
//
//let CacheFilePath = NSHomeDirectory() + "/Documents/CacheFile/SX"
//
//enum SXFileCacheTime : NSInteger {
//    case Minute  = 60
//    case Hour    = 3600
//    case Day     = 86400
//    case Week    = 604800
//    case Month   = 2592000
//    case Forever = 0
//}
//
//class SX_FileManger: NSObject {
//    
//}
//
///**
// * 写入文件
// **/
//extension SX_FileManger {
//    class func witeToFile (fileName: NSString,content: NSString) -> Bool {
//        let error1 = Bool()
//        let filePath = CacheFilePath + "/" + (fileName as String)
//        let fileManager = FileManager.default
//        if !(fileManager.fileExists(atPath: filePath)) {
//            do{
//                try fileManager.createDirectory(atPath: CacheFilePath, withIntermediateDirectories: true, attributes: nil)
//            }
//            catch { }
//        }
//        
//        if !(error1) {
//            do {
//                try content.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8.rawValue)
//            }
//            catch { }
//            return true
//        } else {
//            return false
//        }
//    }
//}
//
///**
// *  文件的读取
// *
// *  return 返回字符串
// */
//extension SX_FileManger {
//    class func readFile (fileName: NSString) -> NSString {
//        let error = Bool()
//        let filePath = CacheFilePath + "/" + (fileName as String)
//        let fileManager = FileManager.default
//        var fileStr = ""
//        if fileManager.fileExists(atPath: filePath) {
//            do {
//                try fileStr = NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue) as String
//            }
//            catch  { }
//        }
//        if !(error) {
//            return fileStr as NSString
//        }else{
//            
//        }
//    }
//}
//
///**
// *  是否有缓存
// */
//extension SX_FileManger {
//    class func isHasCacheFile (fileName: NSString,cacheData:Double) -> Bool {
//        let filePath = CacheFilePath + "/" + (fileName as String)
//        let fileManager = FileManager.default
//        
//        if !(fileManager.fileExists(atPath: filePath)) {
//            return false
//        }
//        
//        //let _ : NSError? = nil
//        
//        do{
//            let fileAttributes = try fileManager.attributesOfItem(atPath: filePath) as NSDictionary
//            
//            if fileAttributes != nil {
//                let fileCreatDate = fileAttributes.object(forKey: FileAttributeKey.creationDate) as! NSDate
//                let timeInterval = -(fileCreatDate.timeIntervalSinceNow)
//                
//                if timeInterval > cacheData {
//                    return false
//                } else {
//                    return true
//                }
//            }
//            return true
//        }
//        catch  { }
//        return true
//    }
//}
//
///**
// *  清除指定路径的缓存文件
// */
//extension SX_FileManger {
//    class func deleteCacheFiles (filePath: NSString) -> Bool {
//        let fileManager = FileManager.default
//        if fileManager.fileExists(atPath: filePath as String) {
//            do {
//                try fileManager.removeItem(atPath: filePath as String)
//            }
//            catch { }
//        }
//        return true
//    }
//}
//
///**
// *  清除所有缓存文件
// */
//extension SX_FileManger {
//    class func clearAllCacheFile() -> Bool {
//        let fileManager = FileManager.default
//        if fileManager.fileExists(atPath: CacheFilePath as String) {
//            do {
//                try fileManager.removeItem(atPath: CacheFilePath as String)
//            }
//            catch { }
//        }
//        return true
//    }
//}
