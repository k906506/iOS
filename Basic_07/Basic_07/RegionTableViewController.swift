//
//  RegionTableViewController.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/14.
//

import UIKit

class RegionTableViewController : UIViewController {
    var cities: [RegionItem] = []
    var city: String = "대전"
    let apiKey: String = "DlsG82zYpBjL3dL6XB52XaI9n%2FLX37nb5v%2BjUrn9IxLT%2Fe78qeC6ChO9heFQeJwv%2BpclYR8ux0Q4e1stnKHE2Q%3D%3D"
    
    @IBOutlet weak var regionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regionTableView.dataSource = self
        self.regionTableView.delegate = self
        
        self.getData(city: city)
    }
    
    func getData(city: String) {
        let session: URLSession = URLSession(configuration: .default)
        let addr: String = "https://apis.data.go.kr/B552584/MsrstnInfoInqireSvc/getMsrstnList?serviceKey=\(apiKey)&returnType=json&numOfRows=100&pageNo=1&addr=\(city)"
        
        guard let encodedStr = addr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let encodedAndReplacingStr = encodedStr.replacingOccurrences(of: "%25", with: "%")
        guard let url = URL(string: encodedAndReplacingStr) else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error {
                print(String(describing: error))
            }
            
            if let data = data {
                do {
                    let userResponse = try JSONDecoder().decode(UserRegionResponse.self, from: data)
                    self.cities = userResponse.response.body.items
                    DispatchQueue.main.async {
                        self.regionTableView.reloadData()
                    }
                } catch(let error) {
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}

// Cell 선택 시 동작
extension RegionTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegionWeatherViewController") as? RegionWeatherViewController else { return }
        viewController.stationName = self.cities[indexPath.row].stationName
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// Cell 세부 정보
extension RegionTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell", for:indexPath) as? RegionCell else { return UITableViewCell() }
        cell.getData(city: self.cities[indexPath.row])
        return cell
    }
}
