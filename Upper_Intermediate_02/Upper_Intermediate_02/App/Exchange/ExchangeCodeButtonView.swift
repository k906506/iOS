//
//  ExchangeCodeButtonView.swift
//  Upper_Intermediate_02
//
//  Created by 고도 on 2023/01/20.
//

import SnapKit
import UIKit

final class ExchangeCodeButtonView: UIView {
    private lazy var exchangeCodeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("코드 교환", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 7
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(exchangeCodeButton)
        
        exchangeCodeButton.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
