//
//  ViewController.swift
//  Basic_07
//
//  Created by 고도 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapFindButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegionTableViewController") as? RegionTableViewController else { return }
        viewController.city = self.cityNameTextField.text ?? "대전"
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
