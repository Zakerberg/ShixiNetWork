//
//  SX_ADScrollerView.swift
//  SX_NetWork
//
//  Created by heather on 2018/3/21.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

enum pageStyle {
    case Left
    case None
    case Center
    case Right
}

protocol SX_ADScrollerViewDelegate {
    
    func cycleScrollerView(cyleScrollerView:SX_ADScrollerView,didSelectedIndex:NSInteger)
}

class SX_ADScrollerView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var imageURLArray : NSArray!
    var titlesArray : NSArray!
    var autoScrollTimeInterval : CGFloat {
        didSet {
            
            self.timer.invalidate()
            setupTimer()
        }
    }
    
    var pageControllerAliment : pageStyle!
    var delegate : Any!
    var mainView : UICollectionView!
    var flowLayout : UICollectionViewFlowLayout!
    var timer : Timer!
    var totalItemCount : NSInteger!
    var pageControl : UIPageControl!
    
    static var ID = "cycleCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.pageControllerAliment = pageStyle.Center
        self.autoScrollTimeInterval = 3.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cycleScrollerViewWithFrame (frame:CGRect, imageArray:NSArray) -> Self {
        
        let adCycleScrollerView = SX_ADScrollerView(frame: frame)
        
        adCycleScrollerView.imageURLArray = imageArray
        
        return adCycleScrollerView
        
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.totalItemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SX_ADScrollerView.ID, for: indexPath) as! SX_ADCollectionViewCell
        
        let itemIndex = indexPath.item % self.imageURLArray.count
        
        
        
        
        
        
        
        
        
        
    }
    
    func cycleScrollerViewWithFrame (frame:CGFloat, imageArray:NSArray)  {
        
        
    }
    
    
    func setupTimer() {
        
        let timer : Timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.autoScrollTimeInterval), target: self, selector: #selector(automaticScroll), userInfo: nil, repeats: true)
        
        self.timer = timer
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    
    @objc func automaticScroll() {
        
        let currentIndex = self.mainView.contentOffset.x / self.flowLayout.itemSize.width
        
        var targetIndex = currentIndex + 1
        
        if targetIndex == CGFloat(self.totalItemCount) {
            targetIndex = CGFloat(self.totalItemCount / 2)
            self.mainView.scrollToItem(at: NSIndexPath.init(item: Int(targetIndex), section: 0) as IndexPath, at: UICollectionViewScrollPosition.left, animated: false)
        }
        
        mainView.scrollToItem(at: NSIndexPath.init(item: Int(targetIndex), section: 0) as IndexPath, at: UICollectionViewScrollPosition.left, animated: true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.mainView.contentOffset.x == 0 {
            self.mainView.scrollToItem(at: NSIndexPath.init(item: (self.totalItemCount/2), section: 0) as IndexPath, at:UICollectionViewScrollPosition.left, animated: false)
        }
    }
}






