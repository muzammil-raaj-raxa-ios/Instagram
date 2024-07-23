//
//  ViewController.swift
//  Instagram
//
//  Created by Mag isb-10 on 19/07/2024.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    handleNotAuthenticated()
  }
  
  private func handleNotAuthenticated() {
    if Auth.auth().currentUser == nil {
      // Goto Login VC
      let loginVC = LoginVC()
      loginVC.modalPresentationStyle = .fullScreen
      present(loginVC, animated: false)
    }
  }

}

