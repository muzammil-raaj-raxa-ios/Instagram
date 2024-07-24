//
//  LoginVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit
import SafariServices
import FirebaseAuth

class LoginVC: UIViewController {
  
  struct Constants {
    static let cornerRadius: CGFloat = 8.0
  }
  
  private let headerView: UIView = {
    let header = UIView()
    header.clipsToBounds = true
    let bgImgView = UIImageView(image: UIImage(named: "gradientBg"))
    header.addSubview(bgImgView)
    return header
  }()
  
  private let usernameEmailTF: UITextField = {
    let field = UITextField()
    field.placeholder = "Username or Email..."
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
  
  private let loginBtn: UIButton = {
    let button = UIButton()
    button.setTitle("Log In", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  private let createAccountBtn: UIButton = {
    let button = UIButton()
    button.setTitleColor(.label, for: .normal)
    button.setTitle("New User? Create an account.", for: .normal)
    return button
  }()
  
  private let termsBtn: UIButton = {
    let button = UIButton()
    button.setTitle("Terms of Services", for: .normal)
    button.setTitleColor(UIColor.secondaryLabel, for: .normal)
    return button
  }()
  
  private let privacyBtn: UIButton = {
    let button = UIButton()
    button.setTitle("Privacy Policy", for: .normal)
    button.setTitleColor(UIColor.secondaryLabel, for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addSubview()
    view.backgroundColor = .systemBackground
    
    usernameEmailTF.delegate = self
    passwordTF.delegate = self
    
    loginBtn.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
    createAccountBtn.addTarget(self, action: #selector(didTapCreateAccountBtn), for: .touchUpInside)
    privacyBtn.addTarget(self, action: #selector(didTapPrivacyBtn), for: .touchUpInside)
    termsBtn.addTarget(self, action: #selector(didTapTermsBtn), for: .touchUpInside)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    headerView.frame = CGRect(
      x: 0,
      y: 0,
      width: view.width,
      height: view.height / 3.0
    )
    configureHeaderView()
    
    usernameEmailTF.frame = CGRect(
      x: 25,
      y: headerView.bottom + 50,
      width: view.width - 50,
      height: 52
    )
    
    passwordTF.frame = CGRect(
      x: 25,
      y: usernameEmailTF.bottom + 15,
      width: view.width - 50,
      height: 52
    )
    
    loginBtn.frame = CGRect(
      x: 25,
      y: passwordTF.bottom + 30,
      width: view.width - 50,
      height: 52
    )
    
    createAccountBtn.frame = CGRect(
      x: 25,
      y: loginBtn.bottom + 15,
      width: view.width - 50,
      height: 52
    )
    
    termsBtn.frame = CGRect(
      x: 10,
      y: view.height - view.safeAreaInsets.bottom - 100,
      width: view.width - 20,
      height: 20
    )
    
    privacyBtn.frame = CGRect(
      x: 10,
      y: view.height - view.safeAreaInsets.bottom - 50,
      width: view.width - 20,
      height: 20
    )
  }
  
  private func addSubview() {
    view.addSubview(headerView)
    view.addSubview(usernameEmailTF)
    view.addSubview(passwordTF)
    view.addSubview(loginBtn)
    view.addSubview(privacyBtn)
    view.addSubview(termsBtn)
    view.addSubview(createAccountBtn)
  }
  
  private func configureHeaderView() {
    guard headerView.subviews.count == 1 else {
      return
    }
    
    guard let backgroundView = headerView.subviews.first else {
      return
    }
    
    backgroundView.frame = headerView.bounds
    
    let logoImage = UIImageView(image: UIImage(named: "logo"))
    headerView.addSubview(logoImage)
    logoImage.contentMode = .scaleAspectFit
    logoImage.frame = CGRect(
      x: Int(headerView.width/4.0),
      y: Int(view.safeAreaInsets.top),
      width: Int(headerView.width/2),
      height: Int(headerView.height - view.safeAreaInsets.top)
    )
  }
  
  @objc private func didTapLoginBtn() {
    usernameEmailTF.resignFirstResponder()
    passwordTF.resignFirstResponder()
    
    guard let usernameEmail = usernameEmailTF.text, !usernameEmail.isEmpty,
          let password = passwordTF.text, !password.isEmpty, password.count >= 6 else {
      return
    }
    
    var username: String?
    var email: String?
    
    if usernameEmail.contains("@"), usernameEmail.contains(".") {
      //email
      email = usernameEmail
    } else {
      //username
      username = usernameEmail
    }
    
    AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
      DispatchQueue.main.async {
        if success {
          self.dismiss(animated: true, completion: nil)
        } else {
          let alert = UIAlertController(title: "Error", message: "Invalid username of password.", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
          self.present(alert, animated: true, completion: nil)
        }
      }
    }
    
  }
  
  @objc private func didTapTermsBtn() {
    guard let url = URL(string: "https://help.instagram.com/581066165581870/") else {
      return
    }
    
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true)
  }
  
  @objc private func didTapPrivacyBtn() {
    guard let url = URL(string: "https://help.instagram.com/search/?helpref=search&query=privacy%20policy") else {
      return
    }
    
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true)
  }
  
  @objc private func didTapCreateAccountBtn() {
    let vc = RegistrationVC()
    vc.title = "Create Account"
    present(UINavigationController(rootViewController: vc), animated: true)
  }
  
}
 

extension LoginVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == usernameEmailTF {
      passwordTF.becomeFirstResponder()
    } else if textField == passwordTF {
      didTapLoginBtn()
    }
    
    return true
  }
}
