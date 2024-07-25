//
//  SettingsVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

struct SettingCellModel {
  let title: String
  let handler: (() -> Void)
}

final class SettingsVC: UIViewController {
  
  private let tableview: UITableView = {
    let tableview = UITableView(frame: .zero, style: .grouped)
    tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableview
  }()
  
  private var data = [[SettingCellModel]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    view.addSubview(tableview)
    tableview.delegate = self
    tableview.dataSource = self
    
    configureModels()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableview.frame = view.bounds
  }
  
  private func configureModels() {
    let section = [
      SettingCellModel(title: "Log out") { [weak self] in
        self?.didTapLogout()
      }
    ]
    
    data.append(section)
  }
  
  private func didTapLogout() {
    let actionsheet = UIAlertController(title: "Log out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
    actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    actionsheet.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { _ in
      AuthManager.shared.logOut(completion: { success in
        DispatchQueue.main.async {
          if success {
            let loginVC = LoginVC()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true) {
              self.navigationController?.popToRootViewController(animated: false)
              self.tabBarController?.selectedIndex = 0
            }
          } else {
            fatalError("Could not logged out user.")
          }
        }
      })
    }))
    
    actionsheet.popoverPresentationController?.sourceView = tableview
    actionsheet.popoverPresentationController?.sourceRect = tableview.bounds
    present(actionsheet, animated: true)
  }
  
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = data[indexPath.section][indexPath.row].title
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    data[indexPath.section][indexPath.row].handler()
  }
  
}
