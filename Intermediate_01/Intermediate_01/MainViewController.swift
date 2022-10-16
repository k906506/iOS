//
//  MainViewController.swift
//  Intermediate_01
//
//  Created by 고도 on 2022/10/16.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        guard let email = Auth.auth().currentUser?.email else { return }
        self.welcomeLabel.text = """
            환영합니다.
            \(email)님
            """
    }
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
