//
//  WriteDiaryViewController.swift
//  Basic_05
//
//  Created by 고도 on 2022/09/06.
//

import UIKit

class WriteDiaryViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.confirmButton.isEnabled = false
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldValueDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldValueDidChange(_:)), for: .editingChanged)
    }
    
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/225, green: 220/225, blue: 220/225, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.2
        self.contentsTextView.layer.cornerRadius = 8.0
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko-KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formatter.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !(self.contentsTextView.text.isEmpty)
    }
    
    @objc private func titleTextFieldValueDidChange(_ textField : UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldValueDidChange(_ dateField : UITextField) {
        self.validateInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension WriteDiaryViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
