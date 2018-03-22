//
//  SX_ADCollectionViewCell.swift
//  SX_NetWork
//
//  Created by heather on 2018/3/21.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

class SX_ADCollectionViewCell: UICollectionViewCell {
    
    private var titleLabel : UILabel!
    var imageView : UIImageView!
    var title : NSString! {
        didSet{
            self.title = title.copy() as! NSString
            self.titleLabel.text = NSString.localizedStringWithFormat("    \(title)" as NSString) as String
        }
    }

    var bgView : UIView!
    
    override init(frame: CGRect) {
        
        let imageView = UIImageView()
        self.imageView = imageView
        self.addSubview(imageView)
        
        self.bgView = UIView()
        self.bgView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.addSubview(self.bgView)
        
        let titleLabel = UILabel()
        self.titleLabel = titleLabel
        self.titleLabel.isHidden = true
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.systemFont(ofSize: 13.0)
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = self.bounds
        let titleLabelW : CGFloat = self.frame.size.width - 60
        let titleLabelH : CGFloat = 30
        let titleLabelX : CGFloat = 0
        let titleLabelY : CGFloat = self.frame.size.height - titleLabelH
        
        self.titleLabel.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelW, height: titleLabelH)
        
        self.titleLabel.isHidden = !(self.titleLabel != nil)
        self.bgView.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelW+60, height: titleLabelH)
    }
}
