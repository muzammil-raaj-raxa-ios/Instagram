//
//  EditProfileVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

struct EditProfileFormModel {
  let label: String
  let placeholder: String
  var value: String?
}

final class EditProfileVC: UIViewController, FormCellDelegate {

  private let tableview: UITableView = {
    let tableview = UITableView()
    tableview.register(FormCell.self, forCellReuseIdentifier: FormCell.identifier)
    return tableview
  }()
  
  private var models = [[EditProfileFormModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      navigationItem.rightBarButtonItem = UIBarButtonItem(
        title: "Save", style: .done, target: self, action: #selector(didTapSaveBtn)
      )
      navigationItem.leftBarButtonItem = UIBarButtonItem(
        title: "Cancel", style: .plain, target: self, action: #selector(didTapCancelBtn)
      )
      
      view.addSubview(tableview)
      tableview.dataSource = self
      tableview.tableHeaderView = createTblHeaderView()
      
      configureModels()
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    tableview.frame = view.bounds
  }
  
  func formTblViewCell(_ cell: FormCell, didUpdateField updatedModel: EditProfileFormModel) {
    
    print(updatedModel.value ?? "")
  }

  
  private func configureModels() {
    let section1Lbl = ["Name", "Username", "Bio"]
    var section1 = [EditProfileFormModel]()
    for label in section1Lbl {
      let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
      section1.append(model)
    }
    models.append(section1)
    
    let section2Lbl = ["Email", "Phone", "Gender"]
    var section2 = [EditProfileFormModel]()
    for label in section2Lbl {
      let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
      section2.append(model)
    }
    models.append(section2)
  }
  
  private func createTblHeaderView() -> UIView {
    let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height / 4).integral)
    let size = header.height / 1.5
    let profilePhotoBtn = UIButton(frame: CGRect(
      x: (view.width-size)/2, y: (header.height-size)/2, width: size, height: size)
    )
    header.addSubview(profilePhotoBtn)
    profilePhotoBtn.layer.masksToBounds = true
    profilePhotoBtn.layer.cornerRadius = size / 2.0
    profilePhotoBtn.addTarget(self, action: #selector(didTapProfilePhotoBtn), for: .touchUpInside)
    profilePhotoBtn.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
    profilePhotoBtn.tintColor = .label
    profilePhotoBtn.layer.borderWidth = 1
    profilePhotoBtn.layer.borderColor = UIColor.secondarySystemBackground.cgColor
    
    return header
  }
  
  @objc private func didTapProfilePhotoBtn() {
    
  }
  
  @objc private func didTapSaveBtn() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc private func didTapCancelBtn() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc private func didTapChangeProfilePic() {
    let actionsheet = UIAlertController(title: "Profile Picture", message: "Change Profile Picture", preferredStyle: .actionSheet)
    actionsheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
      
    }))
    actionsheet.addAction(UIAlertAction(title: "Choose from Gallery", style: .default, handler: { _ in
      
    }))
    actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    actionsheet.popoverPresentationController?.sourceView = view
    actionsheet.popoverPresentationController?.sourceRect = view.bounds
    present(actionsheet, animated: true)
  }

}

extension EditProfileVC: UITableViewDataSource  {
  func numberOfSections(in tableView: UITableView) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = models[indexPath.section][indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: FormCell.identifier, for: indexPath) as! FormCell
    cell.configure(with: model)
    cell.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard section == 1 else {
        return nil
    }
    return "Private Information"
  }
  
}
