//
//  ViewController.swift
//  Basic_01
//
//  Created by 고도 on 2022/05/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    let quotes = [
        Quote(contents: "첫 번째 명언", name: "고도현"),
        Quote(contents: "두 번째 명언", name: "고도현"),
        Quote(contents: "세 번째 명언", name: "고도현"),
        Quote(contents: "네 번째 명언", name: "고도현"),
        Quote(contents: "다섯 번째 명언", name: "고도현")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initViews()
    }
    
    func initViews() {
        let random = randomNumber(number: 5)
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
    
    func randomNumber(number : Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    @IBAction func tapQuoteGeneratorButton(_ sender: Any) {
        let random = randomNumber(number: 5)// 0 ~ 4 사이의 난수를 생성
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
}

