//
//  RoundButton.swift
//  Basic_03
//
//  Created by 고도 on 2022/06/26.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound : Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
