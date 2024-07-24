//
//  RegistrationVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

class RegistrationVC: UIViewController {
  
  struct Constants {
    static let cornerRadius: CGFloat = 8.0
  }
  
  private let usernameTF: UITextField = {
    let field = UITextField()
    field.placeholder = "Username..."
    field.returnKeyType = .next
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.keyboardType = .emailAddress
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    field.layer.borderWidth = 1.0
    field.layer.borderColor = UIColor.secondaryLabel.cgColor
    return field
  }()
  
  private let emailTF: UITextField = {
    let field = UITextField()
    field.placeholder = "Email address..."
    field.returnKeyType = .next
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.keyboardType = .emailAddress
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    field.layer.borderWidth = 1.0
    field.layer.borderColor = UIColor.secondaryLabel.cgColor
    return field
  }()
  
  private let passwordTF: UITextField = {
    let field = UITextField()
    field.placeholder = "Password..."
    field.returnKeyType = .continue
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    field.layer.borderWidth = 1.0
    field.layer.borderColor = UIColor.secondaryLabel.cgColor
    field.isSecureTextEntry = true
    return field
  }()
  
  private let registerBtn: UIButton = {
    let button = UIButton()
    button.setTitle("Sign Up", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .systemGreen
    button.setTitleColor(.white, for: .normal)
    return button
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      
      view.addSubview(usernameTF)
      view.addSubview(emailTF)
      view.addSubview(passwordTF)
      view.addSubview(registerBtn)
      
      registerBtn.addTarget(self, action: #selector(didTapRegisterBtn), for: .touchUpInside)
      
      usernameTF.delegate = self
      emailTF.delegate = self
      passwordTF.delegate = self
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    usernameTF.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width: view.width - 40, height: 52)
    emailTF.frame = CGRect(x: 20, y: usernameTF.bottom + 10, width: view.width - 40, height: 52)
    passwordTF.frame = CGRect(x: 20, y: emailTF.bottom + 10, width: view.width - 40, height: 52)
    registerBtn.frame = CGRect(x: 20, y: passwordTF.bottom + 10, width: view.width - 40, height: 52)
  }
  
  @objc private func didTapRegisterBtn() {
    usernameTF.resignFirstResponder()
    emailTF.resignFirstResponder()
    passwordTF.resignFirstResponder()
    
    guard let username = usernameTF.text, !username.isEmpty,
          let email = emailTF.text, !email.isEmpty,
          let password = passwordTF.text, !password.isEmpty, password.count >= 6 else {
      return
    }
    
    AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
      DispatchQueue.main.async {
        if registered {
            
        } else {
          
        }
      }
    }

  }
  

}

extension RegistrationVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == usernameTF {
      emailTF.becomeFirstResponder()
    } else if textField == emailTF {
      passwordTF.becomeFirstResponder()
    } else if textField == passwordTF {
      didTapRegisterBtn()
    }
    
    return true
  }
}
