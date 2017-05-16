//
//  MenuBar.swift
//  TrackList_3
//
//  Created by trioxis on 14/5/17.
//  Copyright © 2017 Jajwol. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let groupNames = ["Home","Work", "🐱"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 101, green: 101, blue: 242)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.tabView.text = groupNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell {
    
    let tabView: UILabel = {
        let tabView = UILabel()
        tabView.backgroundColor = UIColor.white
        tabView.font = UIFont.boldSystemFont(ofSize: 12)
        tabView.textColor = UIColor.rgb(red: 222, green: 222, blue: 222)
        
        tabView.layer.cornerRadius = 13
        tabView.clipsToBounds = true
        
        tabView.layer.shadowColor = UIColor.black.cgColor
        tabView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        
        tabView.textAlignment = NSTextAlignment.center
        
        tabView.text = "Home"
        
        return tabView
    }()
    
    override var isHighlighted: Bool{
        didSet {
            tabView.backgroundColor = isHighlighted ? (UIColor.rgb(red: 75, green: 75, blue: 178)) : UIColor.white
            tabView.textColor = isHighlighted ? (UIColor.rgb(red: 29, green: 255, blue: 143)) : (UIColor.rgb(red: 222, green: 222, blue: 222))
        }
        
    }
    
    override var isSelected: Bool{
        didSet {
            tabView.backgroundColor = isSelected ? (UIColor.rgb(red: 75, green: 75, blue: 178)) : UIColor.white
            tabView.textColor = isSelected ? (UIColor.rgb(red: 29, green: 255, blue: 143)) : (UIColor.rgb(red: 222, green: 222, blue: 222))
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(tabView)
        addConstraintsWithFormat(format: "H:[v0(60)]", views: tabView)
        addConstraintsWithFormat(format: "V:[v0(26)]", views: tabView)
        
        addConstraint(NSLayoutConstraint(item: tabView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: tabView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    
}
