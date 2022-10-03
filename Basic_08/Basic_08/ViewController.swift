//
//  ViewController.swift
//  Basic_08
//
//  Created by 고도 on 2022/09/23.
//

import UIKit

import Alamofire
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var totalCaseLabel: UILabel!
    
    let apiKey = "AT7mruCLHQV8geJZRN6fx1zwIUdbiYapc"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverview(completionHandler: { [weak self] result in
            guard let self = self else { return } // self에 대한 옵셔널 바인딩
            
            switch result {
            case let.success(result):
                debugPrint(result)
                self.configureStackView(koreaCovidOverview: result.korea)
                let covidOverviewList = self.makeCovidOverviewList(cityCovidOverview: result)
                self.configureChartView(covidOverviewList: covidOverviewList)
                
            case let.failure(error):
                debugPrint("error \(error)")
            }
            
        })
    }
    
    func makeCovidOverviewList(
        cityCovidOverview: CityCovidOverview
    ) -> [CovidOverview] {
        return [
            cityCovidOverview.seoul,
            cityCovidOverview.busan,
            cityCovidOverview.daegu,
            cityCovidOverview.incheon,
            cityCovidOverview.gwangju,
            cityCovidOverview.daejeon,
            cityCovidOverview.ulsan,
            cityCovidOverview.sejong,
            cityCovidOverview.gyeonggi,
            cityCovidOverview.chungbuk,
            cityCovidOverview.chungnam,
            cityCovidOverview.gyeongbuk,
            cityCovidOverview.gyeongnam,
            cityCovidOverview.jeju
        ]
    }
    
    func configureChartView(covidOverviewList: [CovidOverview]) -> Void {
        self.pieChartView.delegate = self
        
        let entries = covidOverviewList
            .sorted(by: { $0.incDecK > $1.incDecK})
            .compactMap { [weak self] overview -> PieChartDataEntry? in
                guard let self = self else { return nil }
                return PieChartDataEntry(
                    value: self.removeFormatString(string: "\(overview.incDecK)"),
                    label: overview.countryNm,
                    data: overview
                )
            }
        
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.valueTextColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        
        dataSet.colors = ChartColorTemplates.vordiplom() +
        ChartColorTemplates.joyful() +
        ChartColorTemplates.liberty() +
        ChartColorTemplates.pastel() +
        ChartColorTemplates.material()
        
        self.pieChartView.data = PieChartData(dataSet: dataSet)
    }
    
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    func configureStackView(koreaCovidOverview: CovidOverview) {
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCnt)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.incDecK)명"
    }
    
    func fetchCovidOverview (
        completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void
    ) {
        let url: String = "https://api.corona-19.kr/korea/beta/"
        let param = [
            "serviceKey": "\(apiKey)"
        ]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: {response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
    }
}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CovidDetailTableViewController") as? CovidDetailTableViewController else { return }
        guard let covidOverView = entry.data as? CovidOverview else { return }
        covidDetailViewController.covidOverView = covidOverView
        self.navigationController?.pushViewController(covidDetailViewController, animated: true)
    }
}
