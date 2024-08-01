//
//  UserFollowCell.swift
//  Instagram
//
//  Created by Mag isb-10 on 01/08/2024.
//

import UIKit

class UserFollowCell: UITableViewCell {

  static let initializer = "UserFollowCell"
  
  private let profileImgView: UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFill
    return imgView
  }()
  
  private let nameLbl: UILabel = {
    let lbl = UILabel()
    lbl.numberOfLines = 1
    lbl.font = .systemFont(ofSize: 17, weight: .semibold)
    return lbl
  }()
  
  private let userNameLbl: UILabel = {
    let lbl = UILabel()
    lbl.numberOfLines = 1
    lbl.font = .systemFont(ofSize: 16, weight: .regular)
    return lbl
  }()
  
  private let followBtn: UIButton = {
    let btn = UIButton()
    return btn
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    clipsToBounds = true
    contentView.addSubview(profileImgView)
    contentView.addSubview(nameLbl)
    contentView.addSubview(userNameLbl)
    contentView.addSubview(followBtn)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    profileImgView.image = nil
    nameLbl.text = nil
    userNameLbl.text = nil
    followBtn.setTitle(nil, for: .normal)
    followBtn.backgroundColor = nil
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
