//
//  RegionWeatherViewController.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/15.
//

import Foundation
import UIKit

class RegionWeatherViewController : UIViewController {
    
    @IBOutlet weak var stationNameTextLabel: UILabel!
    @IBOutlet weak var pm10TextLabel: UILabel!
    @IBOutlet weak var pm25TextLabel: UILabel!
    @IBOutlet weak var o3TextLabel: UILabel!
    @IBOutlet weak var no2TextLabel: UILabel!
    @IBOutlet weak var timeTextLabel: UILabel!
    
    var pm10: String = ""
    var pm25: String = ""
    var o3: String = ""
    var no2: String = ""
    var time: String = ""
    var stationName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData(stationName: stationName)
    }
    
    func getData(stationName: String) {
        let apiKey: String = "DlsG82zYpBjL3dL6XB52XaI9n%2FLX37nb5v%2BjUrn9IxLT%2Fe78qeC6ChO9heFQeJwv%2BpclYR8ux0Q4e1stnKHE2Q%3D%3D"
        let session: URLSession = URLSession(configuration: .default)
        let addr: String =      "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?serviceKey=\(apiKey)&returnType=json&numOfRows=1&pageNo=1&stationName=\(stationName)&dataTerm=DAILY&ver=1.0"
        
        guard let encodedStr = addr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let encodedAndReplacingStr = encodedStr.replacingOccurrences(of: "%25", with: "%")
        guard let url = URL(string: encodedAndReplacingStr) else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error {
                print(String(describing: error))
            }
            
            if let data = data {
                do {
                    let userResponse = try JSONDecoder().decode(UserWeatherResponse.self, from: data)
                    let data = userResponse.response.body.items[0]
                
                    DispatchQueue.main.async {
                        self.stationNameTextLabel.text = stationName
                        self.pm10TextLabel.text = data.pm10Value
                        self.pm25TextLabel.text = data.pm25Value
                        self.o3TextLabel.text = data.o3Value
                        self.no2TextLabel.text = data.no2Value
                        self.timeTextLabel.text = data.dataTime
                    }
                } catch(let error) {
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}
