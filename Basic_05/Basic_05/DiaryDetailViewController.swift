//
//  DiartyDetailViewController.swift
//  Basic_05
//
//  Created by 고도 on 2022/09/06.
//

import UIKit

//protocol DiaryDetailViewDelegate : AnyObject {
//    func didSelectDelect(indexPath : IndexPath)
//    func didSelectStar(indexPath : IndexPath, isStar : Bool)
//}

class DiaryDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsTextView : UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    var starButton: UIBarButtonItem?
    
    // weak var delegate : DiaryDetailViewDelegate?
    
    var diary : Diary?
    var indexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = self.dateToString(date: diary.date)
        self.starButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tapStarButton))
        self.starButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.starButton?.tintColor = .orange
        self.navigationItem.rightBarButtonItem = self.starButton
    }
    
    private func dateToString(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    @IBAction func tapEditButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
        guard let indexPath = self.indexPath else { return }
        guard let diary = self.diary else { return }
        viewController.diaryEditorMode = .edit(indexPath, diary)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(editDiaryNotification(_:)),
            name: NSNotification.Name("editDiary"),
            object: nil)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func editDiaryNotification(_ notification : Notification) {
        guard let diary = notification.object as? Diary else { return }
        // guard let row = notification.userInfo?["indexPath.row"] as? Int else { return }
        self.diary = diary
        // self.indexPath?.row = row
        self.configureView()
    }
    
    @objc func tapStarButton() {
        guard let isStar = self.diary?.isStar else { return }
        guard let indexPath = self.indexPath else { return }

        if isStar {
            self.starButton?.image = UIImage(systemName: "star")
        } else {
            self.starButton?.image = UIImage(systemName: "star.fill")
        }
        self.diary?.isStar = !isStar
        //self.delegate?.didSelectStar(indexPath: indexPath, isStar: self.diary?.isStar ?? false)
        NotificationCenter.default.post(
            name: NSNotification.Name("starDiary"),
            object: [
            "isStar" : self.diary?.isStar ?? false,
            "indexPath" : indexPath
        ],
        userInfo: nil)
    }
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        guard let indexPath = self.indexPath else { return }
        NotificationCenter.default.post(
            name: NSNotification.Name("deleteDiary"),
            object: indexPath,
            userInfo: nil)
        // self.delegate?.didSelectDelect(indexPath: indexPath)
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
