//
//  LoginVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

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
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    return UITextField()
  }()
  
  private let passwordTF: UITextField = {
    let field = UITextField()
    field.placeholder = "Password..."
    field.returnKeyType = .next
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
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
    return UIButton()
  }()
  
  private let privacyBtn: UIButton = {
    return UIButton()
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addSubview()
    view.backgroundColor = .systemBackground
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
      x: 0,
      y: Int(view.safeAreaInsets.top),
      width: Int(headerView.width),
      height: Int(headerView.height - view.safeAreaInsets.top)
    )
  }
  
  @objc private func didTapLoginBtn() {}
  
  @objc private func didTapTermsBtn() {}
  
  @objc private func didTapPrivacyBtn() {}
  
  @objc private func didTapCreateAccountBtn() {}
  
}
 
