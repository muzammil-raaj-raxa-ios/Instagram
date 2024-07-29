//
//  FormCell.swift
//  Instagram
//
//  Created by Mag isb-10 on 29/07/2024.
//

import UIKit

protocol FormCellDelegate: AnyObject {
  func formTblViewCell(_ cell: FormCell, didUpdateField updatedModel: EditProfileFormModel)
}

class FormCell: UITableViewCell {
  
  static let identifier = "FormCell"
  
  private var model: EditProfileFormModel?
  
  public weak var delegate: FormCellDelegate?

  private let formLbl: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.numberOfLines = 1
    return label
  }()
  
  private let field: UITextField = {
    let field = UITextField()
    field.returnKeyType = .done
    return field
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
     clipsToBounds = true
    contentView.addSubview(formLbl)
    contentView.addSubview(field)
    field.delegate = self
    selectionStyle = .none
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure(with model: EditProfileFormModel) {
    self.model = model
    formLbl.text = model.label
    field.placeholder = model.placeholder
    field.text = model.value
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    formLbl.text = nil
    field.placeholder = nil
    field.text = nil
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    formLbl.frame = CGRect(x: 15, y: 0, width: contentView.width / 3, height: contentView.height)
    field.frame = CGRect(x: formLbl.right + 5, y: 0, width: contentView.width - 10 - formLbl.width, height: contentView.height)
  }
  
}

extension FormCell: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    model?.value = textField.text
    guard let model = model else {
      return true
    }
    delegate?.formTblViewCell(self, didUpdateField: model)
    textField.resignFirstResponder()
    return true
  }
}
