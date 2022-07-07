//
//  ViewController.swift
//  Basic_04
//
//  Created by 고도 on 2022/06/30.
//

import UIKit

class ViewController: UIViewController {
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tabEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tabAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title : "할 일 등록", message:"할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title:"등록", style: .default, handler: { _ in })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler : nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        self.present(alert, animated: true, completion: nil)
    }
}

