//
//  CovidDetailTableViewController.swift
//  Basic_08
//
//  Created by 고도 on 2022/09/26.
//

import UIKit

class CovidDetailTableViewController: UITableViewController {
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var newCaseCell: UITableViewCell!
    
    var covidOverView: CovidOverview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        guard let covidOverView = self.covidOverView else { return }
        self.title = covidOverView.countryNm
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverView.totalCnt)명"
        self.newCaseCell.detailTextLabel?.text = "\(covidOverView.incDec)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverView.recCnt)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverView.deathCnt)명"
        self.overseasInflowCell.detailTextLabel?.text = "\(covidOverView.incDecF)명"
        self.regionalOutbreakCell.detailTextLabel?.text =
        "\(covidOverView.incDecK)명"
    }
    
    
    
}
