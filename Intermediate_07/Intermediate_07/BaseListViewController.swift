//
//  BaseListViewController.swift
//  Intermediate_07
//
//  Created by 고도 on 2023/01/16.
//

import UIKit

class BaseListViewController: UITableViewController {
    var beerList: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBar Title
        title = "맥주창고"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // UITableView Set
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
    }
}

extension BaseListViewController {
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
}
