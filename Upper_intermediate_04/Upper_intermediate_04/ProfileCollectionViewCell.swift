//
//  PostCollectionViewCell.swift
//  Upper_intermediate_04
//
//  Created by 고도현 on 2023/03/03.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProfileCollectionViewCell {
    func setupLayout() {
        self.contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
