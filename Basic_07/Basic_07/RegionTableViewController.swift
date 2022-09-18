//
//  RegionTableViewController.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/14.
//

import UIKit

class RegionTableViewController : UIViewController {
    
    @IBOutlet weak var regionTableView: UITableView!
    var items : [String] = ["안녕하세요", "예제입니다"]
    
    override func viewDidLoad() {
        self.regionTableView.dataSource = self
        self.regionTableView.delegate = self
        super.viewDidLoad()
    }
}

// Cell 선택 시 동작
extension RegionTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegionWeatherViewController") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// Cell 세부 정보
extension RegionTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell", for:indexPath) as? RegionCell else { return UITableViewCell() }
        let text = self.items[indexPath.row]
        cell.content?.text = text
        return cell
    }
}
