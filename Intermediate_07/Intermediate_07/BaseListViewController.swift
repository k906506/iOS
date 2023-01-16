//
//  BaseListViewController.swift
//  Intermediate_07
//
//  Created by 고도 on 2023/01/16.
//

import UIKit

class BaseListViewController: UITableViewController {
    var beerList: [Beer] = []
    var currentPage = 1
    var dataTasks = [URLSessionDataTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBar Title
        title = "맥주창고"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // UITableView Set
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
        tableView.prefetchDataSource = self
        
        fetchBeer(of: currentPage)
    }
}

extension BaseListViewController: UITableViewDataSourcePrefetching {
    // 하나의 섹션에 보여줄 아이템의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    // 각각의 아이템에 대한 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else { return UITableViewCell() }
        
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let beerDetailViewController = BeerDetailViewController()
        
        beerDetailViewController.beer = selectedBeer
        self.show(beerDetailViewController.self, sender: self)
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard currentPage != 1 else { return }
        indexPaths.forEach {
            if ($0.row + 1) / 25 + 1 == currentPage {
                self.fetchBeer(of: currentPage)
            }
        }
    }
}

// Data Fetching
private extension BaseListViewController {
    func fetchBeer(of page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)"),
              dataTasks.firstIndex(where: { $0.originalRequest?.url == url }) == nil // 이미 요청한 Task이면
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from: data) else { // 가져온 데이터를 디코딩
                print("[ERROR] Network Error : \(error.debugDescription)")
                return
            }
            
            switch response.statusCode {
            case (200...299): // 성공
                self.beerList += beers
                self.currentPage += 1
                
                DispatchQueue.main.async {
                    self.tableView.reloadData() // tableView 렌더링
                }
            case (400...499): // 클라이언트 에러
                print("""
                    [ERROR] Client Error \(response.statusCode)
                    [Response] \(response)
                    """)
            case (500...599): // 서버 에러
                print("""
                    [ERROR] Server Error \(response.statusCode)
                    [Response] \(response)
                    """)
            default:
                print("""
                    [ERROR] Error \(response.statusCode)
                    [Response] \(response)
                    """)
            }
        }
        
        dataTask.resume()
        // dataTasks.append(dataTask)
    }
}
