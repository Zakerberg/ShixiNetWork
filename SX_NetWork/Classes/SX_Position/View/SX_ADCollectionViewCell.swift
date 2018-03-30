//
//  SX_ADCollectionViewCell.swift
//  SX_NetWork
//
//  Created by heather on 2018/3/21.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit
import Kingfisher

class SX_ADCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    
    var adScrollModel : SX_ADScrollModel? {
        didSet{
            titleLabel.text = adScrollModel?.ad_title
            imageView.kf.setImage(with: URL(string:(adScrollModel?.img_url ?? "")!), placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil) { (image, error, cacheType, imageUrl) in
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetUI
extension SX_ADCollectionViewCell {
    func setUI() {
        imageView.frame = self.bounds
        titleLabel.frame = CGRect(x: 0, y: self.bounds.size.height - 30, width: self.bounds.size.width, height: 30)
        titleLabel.backgroundColor = UIColor(white: 0.4, alpha: 0.3)
        titleLabel.textColor = .white
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
}



