//
//  EmailViewController.swift
//  Intermediate_01
//
//  Created by 고도 on 2022/10/04.
//

import UIKit
import FirebaseAuth

class EmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        // 스토리보드에서 바로 연결해도 됨
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        // 신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error {
                let code = (error as NSError).code
                switch code {
                case 17007:
                    self.loginUser(email: email, password: password)
                default:
                    self.errorMessageLabel.text = error.localizedDescription
                }
            } else {
                self.showMainViewController()
            }
        }
        
        
    }
    
    private func showMainViewController() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            if let error {
                self?.errorMessageLabel.text = error.localizedDescription
            } else {
                self?.showMainViewController()
            }
        }
    }
}

extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text?.isEmpty ?? false
        let isPasswordEmpty = passwordTextField.text?.isEmpty ?? false
        
        loginButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
