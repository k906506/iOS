//
//  FeedTableViewCell.swift
//  Upper_intermediate_04
//
//  Created by 고도현 on 2023/03/02.
//

import SnapKit
import UIKit

final class FeedTableViewCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "paperplane")
        
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "bookmark")
        
        return button
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "홍길동님 외 32명이 좋아합니다"
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.text = "홍길동님 외 32명이 좋아합니다"
        label.numberOfLines = 5
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "2일 전"
        
        return label
    }()
    
    func setupLayout() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookmarkButton,
            currentLikedCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { self.contentView.addSubview($0) }
        
        postImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.width.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.top)
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.width.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.top)
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.width.height.equalTo(buttonWidth)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.width.height.equalTo(buttonWidth)
        }
        
        currentLikedCountLabel.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}
