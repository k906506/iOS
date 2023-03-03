//
//  UploadViewController.swift
//  Upper_intermediate_04
//
//  Created by 고도현 on 2023/03/03.
//

import SnapKit
import UIKit

final class UploadViewController: UIViewController {
    private let uploadImage: UIImage
    
    private lazy var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "취소",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapCancelButton))
        
        return button
    }()
    
    private lazy var uploadButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "공유",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapUploadButton))

        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    private lazy var contentLabel: UITextView = {
        let textView = UITextView()
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 14)
        textView.delegate = self
        
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = uploadButton
        
        setupLayout()
        
        imageView.image = uploadImage
    }
    
    @objc private func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapUploadButton() {
        dismiss(animated: true)
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}

private extension UploadViewController {
    func setupLayout() {
        [imageView, contentLabel].forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(100)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
