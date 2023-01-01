//
//  ContentCollectionViewCell.swift
//  Intermediate_06
//
//  Created by 고도 on 2023/01/02.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // contentView에 적용해야지 변경됨
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview() // contentView의 Edge에 맞게
        }
    }
}
