//
//  LoginViewController.swift
//  Intermediate_01
//
//  Created by 고도 on 2022/10/04.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var emailLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.black.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tapEmailLoginButton(_ sender: Any) {
    }
    
    @IBAction func tapGoogleLoginButton(_ sender: Any) {
    }
    
    @IBAction func tapAppleLoginButton(_ sender: Any) {
    }
}
