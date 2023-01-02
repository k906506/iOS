//
//  ContentCollectionViewRankCell.swift
//  Intermediate_06
//
//  Created by 고도 on 2023/01/03.
//

import UIKit

class ContentCollectionViewRankCell: UICollectionViewCell {
    let imageView = UIImageView()
    let rankLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // contentView
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        // imageView
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        // rankLabel
        rankLabel.font = .systemFont(ofSize: 100, weight: .black)
        rankLabel.textColor = .white
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(25)
        }
    }
}
