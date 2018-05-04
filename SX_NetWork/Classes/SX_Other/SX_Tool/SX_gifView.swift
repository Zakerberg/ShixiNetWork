//
//  SX_gifView.swift
//  SX_NetWork
//
//  Created by Michael 柏 on 5/3/18.
//  Copyright © 2018 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit
import ImageIO
import QuartzCore

class SX_gifView: UIView {
    
    var width:CGFloat{return self.frame.size.width}
    var height:CGFloat{return self.frame.size.height}
    private var gifurl:NSURL!
    private var totalTime:Float = 0
    private var iamgeArray:Array<CGImage> = []
    private var timeArray:Array<NSNumber> = []
    
    /** 加载本地gif
     
     - Parameter name: gif图片名称
     */
    func showGIFImageWithLocalName(name:String)  {
        
        
    }
    
    /// 加载网络gif
    func showGIFImageFromNetWork(url:NSURL) {
        let fileName = self.getMD5StringFromString(url: url.absoluteString!)
        let filePath = NSHomeDirectory()+"Library/Caches/SXGIF"+fileName
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
        }
            
        }
    
    
    
    
    
    func getMD5StringFromString(url: String) -> String {
        return ""
    }
}
