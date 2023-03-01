//
//  StationSearchViewController.swift
//  Upper_Intermediate_03
//
//  Created by 황교범 on 2023/02/23.
//

import SnapKit
import UIKit

class StationSearchViewController: UIViewController {
    private var stations: [Station] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItems()
        setTableViewLayout()
    }
    
    private func setNavigationItems() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
    }
    
    private func setTableViewLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func reqeustStationName(from stationName: String) {
        let string = "http://openapi.seoul.go.kr:8088/sample/json/SearchInfoBySubwayNameService/1/5/\(stationName)"
        let url = URL(string: string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("No Data")
                return
            }
            
            let decoder = JSONDecoder()
            let stationResponseModel = try? decoder.decode(StationResponseModel.self, from: data)
            
            if let stationResponseModel {
                self.stations = stationResponseModel.stations
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        task.resume()
    }
}

extension StationSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "StationSearchCell")
        
        cell.textLabel?.text = stations[indexPath.row].stationName
        cell.detailTextLabel?.text = stations[indexPath.row].lineNumber
        
        return cell
    }
}

extension StationSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StationDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension StationSearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = true
        stations = []
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reqeustStationName(from: searchText)
    }
}
