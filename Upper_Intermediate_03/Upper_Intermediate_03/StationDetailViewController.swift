//
//  StationDetailViewController.swift
//  Upper_Intermediate_03
//
//  Created by 고도현 on 2023/02/28.
//

import SnapKit
import UIKit

final class StationDetailViewController: UIViewController {
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func fetchData() {
        refreshControl.endRefreshing()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: self.view.frame.width - 32, height: 96)
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StationDetailCollectionViewCell.self, forCellWithReuseIdentifier: "StationDetailCollectionViewCell")
        collectionView.dataSource = self
        collectionView.refreshControl = refreshControl
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        navigationItem.title = "왕십리"
    }
}

extension StationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "StationDetailCollectionViewCell",
            for: indexPath) as? StationDetailCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup("고도현", "방구쟁이")
        
        return cell
    }
}

private extension StationDetailViewController {
    func setupLayout() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
