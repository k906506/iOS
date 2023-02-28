//
//  StationDetailCollectionViewCell.swift
//  Upper_Intermediate_03
//
//  Created by 고도현 on 2023/02/28.
//

import SnapKit
import UIKit

final class StationDetailCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)

        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ title: String, _ subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        setupLayout()
    }
}

private extension StationDetailCollectionViewCell {
    func setupLayout() {
        [titleLabel, subtitleLabel].forEach { self.contentView.addSubview($0) }
        
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 16
        
        backgroundColor = .systemBackground
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
