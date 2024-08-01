//
//  FollowListVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

class ListVC: UIViewController {

  private let data: [String]
  
  private let tableview: UITableView = {
    let tableview = UITableView()
    tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell"  )
    return tableview
  }()
  
  init(data: [String]) {
    self.data = data
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      view.addSubview(tableview)
      tableview.delegate = self
      tableview.dataSource = self
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableview.frame = view.bounds
  }

}

extension ListVC: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = data[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let model = data[indexPath.row]
  }
  
}
