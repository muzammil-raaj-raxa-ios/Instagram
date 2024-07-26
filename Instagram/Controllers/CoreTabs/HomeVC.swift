//
//  ViewController.swift
//  Instagram
//
//  Created by Mag isb-10 on 19/07/2024.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {
  
  private let tableview: UITableView = {
    let tableview = UITableView()
    tableview.register(FeedPostsCell.self, forCellReuseIdentifier: FeedPostsCell.identifier)
    return tableview
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableview)
    tableview.delegate = self
    tableview.dataSource = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableview.frame = view.bounds
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostsCell.identifier, for: indexPath) as! FeedPostsCell

    return cell
  }

}
