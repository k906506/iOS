//
//  TodayCollectionCellView.swift
//  Upper_Intermediate_02
//
//  Created by 고도 on 2023/01/19.
//

import UIKit
import SnapKit
import Kingfisher

final class TodayCollectionCellView: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true // 이미지
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    func setup(today: Today) {
        setupSubViews()
        
        // Cell의 그림자
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 8
        
        titleLabel.text = today.title
        subtitleLabel.text = today.subTitle
        descriptionLabel.text = today.description
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
        
    }
}

extension TodayCollectionCellView {
    func setupSubViews() {
        // 구현한 Label, ImageView 추가
        [imageView, titleLabel, subtitleLabel, descriptionLabel]
            .forEach { addSubview($0) }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4) // 부제목의 bottom에 constraint
            $0.leading.equalTo(subtitleLabel)
            $0.trailing.equalTo(subtitleLabel)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(subtitleLabel)
            $0.trailing.equalTo(subtitleLabel)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
