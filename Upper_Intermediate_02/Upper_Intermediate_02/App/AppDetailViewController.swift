//
//  AppDetailViewController.swift
//  Upper_Intermediate_02
//
//  Created by 고도 on 2023/01/20.
//

import SnapKit
import UIKit

final class AppDetailViewController: UIViewController {
    private let today: Today
    
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
        label.numberOfLines = 1
        
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
    
    init(today: Today) {
        self.today = today
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        titleLabel.text = today.title
        descriptionLabel.text = today.description
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
        
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
            $0.trailing.equalToSuperview().inset(8)
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
