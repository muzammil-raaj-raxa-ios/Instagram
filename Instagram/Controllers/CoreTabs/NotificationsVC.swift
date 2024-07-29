//
//  NotificationsVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

class NotificationsVC: UIViewController {
  
  private let tableview: UITableView = {
    let tableview = UITableView()
    tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableview
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Notifications"
    view.backgroundColor = UIColor.systemBackground
    view.addSubview(tableview)
    tableview.delegate = self
    tableview.dataSource = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableview.frame = view.bounds
  }
  
}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
  }
  
}
