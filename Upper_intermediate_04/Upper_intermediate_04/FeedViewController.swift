//
//  FeedViewController.swift
//  Upper_intermediate_04
//
//  Created by 고도현 on 2023/03/02.
//

import SnapKit
import UIKit

final class FeedViewController: UIViewController {
    private lazy var uploadButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: nil)
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none // 테이블뷰의 기본 스타일을 제거
        tableView.dataSource = self
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Instagram"
        navigationItem.rightBarButtonItem = uploadButton
        
        setupLayout()
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setupLayout()
        
        return cell
    }
}

private extension FeedViewController {
    func setupLayout() {
        [tableView].forEach { self.view.addSubview($0) }
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
