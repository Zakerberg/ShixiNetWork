//
//  SX_ADCollectionViewCell.swift
//  SX_NetWork
//
//  Created by heather on 2018/3/21.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

class SX_ADCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    
    var adScrollModel : SX_ADScrollModel? {
        didSet{
         titleLabel.text = adScrollModel?.title
            
            
            
        }
    }
    
    
    
    
}
