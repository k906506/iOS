//
//  NoticeViewController.swift
//  Intermediate_03
//
//  Created by 고도 on 2022/12/26.
//

import UIKit

class NoticeViewController: UIViewController {
    var noticeContent: (title: String, detail: String, date: String)?
    
    @IBOutlet weak var noticeView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noticeView.layer.cornerRadius = 8
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        guard let noticeContent else { return }
        
        titleLabel.text = noticeContent.title
        detailLabel.text = noticeContent.detail
        dateLabel.text = noticeContent.date
    }
    
    @IBAction func tapDoneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
