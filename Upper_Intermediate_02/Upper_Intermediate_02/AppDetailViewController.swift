//
//  AppDetailViewController.swift
//  Upper_Intermediate_02
//
//  Created by 고도 on 2023/01/20.
//

import SnapKit
import UIKit

final class AppDetailViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true // 이미지
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        titleLabel.text = "제목"
        descriptionLabel.text = "내용"
        
        view.backgroundColor = .systemBackground // 다크모드 대응
    }
}

private extension AppDetailViewController {
    func setLayout() {
        [
            imageView, titleLabel, descriptionLabel, downloadButton, shareButton
        ].forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(96)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.width.equalTo(60)
            $0.height.equalTo(32)
        }
        
        shareButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(32)
        }
    }
}
