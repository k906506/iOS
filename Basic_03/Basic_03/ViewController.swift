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
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOp)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    // 피연산자를 입력하고 연산자를 입력 -> firstOp에 피연산자, currentOp에 연산자
    func operation(_ operation : Operation) {
        if self.currentOp != .Unknown {
            if !self.displayNumber.isEmpty {
                self.secondOp = self.displayNumber
                print(self.secondOp)
                self.displayNumber = ""
                
                guard let first = Double(self.firstOp) else { return }
                guard let second = Double(self.secondOp) else { return }
                
                switch self.currentOp {
                case .Add:
                    self.result = String(first + second)
                    break
                case .Subtract:
                    self.result = String(first - second)
                    break
                case .Multiply:
                    self.result = String(first * second)
                case .Divide:
                    if secondOp == "0" {
                        self.numberOutputLabel.text = "오류"
                        return
                    }
                    
                    self.result = String(first / second)
                    break
                default:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = String(Int(result))
                }
                
                self.firstOp = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOp = operation
        } else {
            self.firstOp = self.displayNumber
            self.currentOp = operation
            self.displayNumber = ""
        }
    }
}
