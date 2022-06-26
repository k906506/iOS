//
//  ViewController.swift
//  Basic_03
//
//  Created by 고도 on 2022/06/22.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Multiply
    case Divide
    case Unknown
}

class ViewController: UIViewController {
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOp = ""
    var secondOp = ""
    var currentOp : Operation = .Unknown
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            if numberValue == "0", self.displayNumber.isEmpty {
                return
            }
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOp = ""
        self.secondOp = ""
        self.result = ""
        self.currentOp = .Unknown
        self.numberOutputLabel.text = "0"
    }
    
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
        }
        self.numberOutputLabel.text = self.displayNumber
    }
}

