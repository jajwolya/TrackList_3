//
//  TaskCell.swift
//  TrackList_3
//
//  Created by trioxis on 14/5/17.
//  Copyright © 2017 Jajwol. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TaskCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Task"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        return separatorView
    }()
    
    override func setupViews() {
        addSubview(nameLabel)
        addSubview(separatorView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]-1-[v1(0.3)]|", views: nameLabel, separatorView)
        
        addConstraint(NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 1))
    }
    
}
