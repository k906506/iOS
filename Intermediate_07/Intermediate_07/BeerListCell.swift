//
//  BeerListCell.swift
//  Intermediate_07
//
//  Created by 고도 on 2023/01/17.
//

import UIKit
import SnapKit
import Kingfisher

class BeerListCell: UITableViewCell {
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerImageView, nameLabel, taglineLabel].forEach {
            contentView.addSubview($0)
        }
        
        beerImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 10, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .bold)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0
        
        beerImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(12)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(beerImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        taglineLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(nameLabel) // nameLabel에 연결
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
    }
    
    // 다른 뷰에서 인자 전달받기 위해 메서드 정의
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
        beerImageView.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "exclamationmark.triangle"))
        
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagLine
        
        accessoryType = .disclosureIndicator // 우측에 버튼?처럼 보이게
        selectionStyle = .none // 탭 했을 때 회색 음영 제거
    }
}
