//
//  SX_ADScrollerView.swift
//  SX_NetWork
//
//  Created by heather on 2018/3/21.
//  Copyright © 2018年 Shixi (Beijing) Technology Limited (Company). All rights reserved.
//

import UIKit

var kViewHeight = CGFloat(200)
let CellIdentifier = "CellIdentifier"

class SX_ADScrollerView: UIView {
    
    fileprivate lazy var adCollectionView: UICollectionView = { [unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: SCREEN_WEIGHT, height: kViewHeight)
        layout.minimumLineSpacing = 0
        let adCollectionView : UICollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        adCollectionView.showsHorizontalScrollIndicator = false
        adCollectionView.isPagingEnabled = true
        
        adCollectionView.backgroundColor = UIColor.cyan
        adCollectionView.register(SX_ADCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier)
        
        adCollectionView.dataSource = self
        adCollectionView.delegate = self
        
        return adCollectionView
        }()
    
    fileprivate lazy var pageControl : UIPageControl = {
        let pageControl: UIPageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 1
        return pageControl
    }()
    
    var timer : Timer?
    
    var adScrollModelArr : [SX_ADScrollModel]? {
        didSet{
            self.adCollectionView.reloadData()
            pageControl.numberOfPages = adScrollModelArr?.count ?? 0
            let index = (adScrollModelArr?.count ?? 0)*10
            self.adCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: false)
            
            removeTimer()
            addTimer()
        }
    }
    
    init(Y: CGFloat, H: CGFloat) {
        kViewHeight = H
        super.init(frame: CGRect(x: 0, y: Y, width: SCREEN_WEIGHT, height: kViewHeight))
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Set UI
extension SX_ADScrollerView {
    func setUI() {
        self.addSubview(adCollectionView)
        self.addSubview(pageControl)
        // 给pageControl 添加约束
        let rightContraint : NSLayoutConstraint = NSLayoutConstraint(item: pageControl, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -10)
        
        
        
    }
}

//MARK: - CollectionViewDelegate
extension SX_ADScrollerView : UICollectionViewDelegate {
    
    
    
    
}


//MARK: - CollectionViewDataSource
extension SX_ADScrollerView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
}


//MARK: - Timer
extension SX_ADScrollerView {
    
    func addTimer()  {
        
    }
    
    func removeTimer() {
        
    }
}





