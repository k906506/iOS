//
//  StationDetailViewController.swift
//  Upper_Intermediate_03
//
//  Created by 고도현 on 2023/02/28.
//

import SnapKit
import UIKit

final class StationDetailViewController: UIViewController {
    let stationName: String
    
    private var arrivalInfos: [RealtimeArrival] = []
    private var timer: Timer?
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        return refreshControl
    }()
    
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
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "30초마다 자동으로 갱신합니다."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        fetchData()
        startTimer()
        
        navigationItem.title = stationName
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        cancelTimer()
    }
    
    init(stationName: String) {
        self.stationName = stationName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func fetchData() {
        let string = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(stationName.replacingOccurrences(of: "역", with: ""))"
        let url = URL(string: string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing() // Response에 관계 없이 종료하도록
            }
            
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("No Data")
                return
            }
            
            print(String(decoding: data, as: UTF8.self))
            
            if let realtimeArrivalListResponseModel = try? JSONDecoder().decode(RealtimeArrivalListResponseModel.self, from: data) {
                self?.arrivalInfos = realtimeArrivalListResponseModel.realtimeArrivalList
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
        
        task.resume()
    }
    
    private func startTimer() {
        if let currentTimer = timer {
            if !currentTimer.isValid {
                timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(fetchData), userInfo: nil, repeats: true)
            }
        } else {
            timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(fetchData), userInfo: nil, repeats: true)
        }
        
        print("타이머 시작")
    }
    
    private func cancelTimer() {
        if let currentTimer = timer {
            if currentTimer.isValid { currentTimer.invalidate() }
        }
        
        print("타이머 종료")
    }
}

extension StationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrivalInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "StationDetailCollectionViewCell",
            for: indexPath) as? StationDetailCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup(arrivalInfos[indexPath.row].lineNumber,
                   arrivalInfos[indexPath.row].remainTime)
        
        return cell
    }
}

private extension StationDetailViewController {
    func setupLayout() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
