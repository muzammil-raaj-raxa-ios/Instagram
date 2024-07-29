//
//  SettingsVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit
import SafariServices

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
    data.append([
      SettingCellModel(title: "Edit Profile") { [weak self] in
        self?.didTapEditProfile()
      },
      SettingCellModel(title: "Invite Friends") { [weak self] in
        self?.didTapInviteFriends()
      },
      SettingCellModel(title: "See Original Posts") { [weak self] in
        self?.didTapSeeOriginalPosts()
      },
    ])
    
    data.append([
      SettingCellModel(title: "Terms of Services") { [weak self] in
        self?.openURl(type: .terms)
      },
      SettingCellModel(title: "Privacy Policy") { [weak self] in
        self?.openURl(type: .privacy)
      },
      SettingCellModel(title: "Help & Feedback") { [weak self] in
        self?.openURl(type: .help)
      },

    ])
    
    data.append([
      SettingCellModel(title: "Log out") { [weak self] in
        self?.didTapLogout()
      }
    ])
  }
  
  private func didTapEditProfile() {
    let vc = EditProfileVC()
    vc.title = "Edit Profile"
    let navVC = UINavigationController(rootViewController: vc)
    navVC.modalPresentationStyle = .fullScreen
    present(navVC, animated: true)
  }
  
  private func didTapInviteFriends() {
    
  }
  
  private func didTapSeeOriginalPosts() {
    
  }
  
  enum SettingsURLType {
    case terms, help, privacy
  }
  
  private func openURl(type: SettingsURLType) {
    let url: String
    switch type {
    case .terms: url = "https://help.instagram.com/581066165581870/"
    case .privacy: url = "https://help.instagram.com/search/?helpref=search&query=privacy%20policy"
    case .help: url = "https://help.instagram.com/"
    }
    
    guard let url = URL(string: url) else {
      return
    }
    
     let vc = SFSafariViewController(url: url)
    present(vc, animated: true)
    
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
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    data[indexPath.section][indexPath.row].handler()
  }
  
}
