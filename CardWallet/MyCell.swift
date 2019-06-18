//
//  MyCell.swift
//  CardWallet
//
//  Created by isec on 2019/6/18.
//  Copyright © 2019 huangrui. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.shadowColor = UIColor.red.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowRadius = 5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
