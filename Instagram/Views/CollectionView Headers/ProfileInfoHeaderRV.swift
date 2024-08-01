//
//  ProfileInfoHeaderRV.swift
//  Instagram
//
//  Created by Mag isb-10 on 30/07/2024.
//

import UIKit

protocol ProfileInfoHeaderRVDelegate: AnyObject{
  func profileHeaderDidTapPostsBtn(_ header: ProfileInfoHeaderRV)
  func profileHeaderDidTapFollowersBtn(_ header: ProfileInfoHeaderRV)
  func profileHeaderDidTapFollowingBtn(_ header: ProfileInfoHeaderRV)
  func profileHeaderDidTapEditProfileBtn(_ header: ProfileInfoHeaderRV)
}

final class ProfileInfoHeaderRV: UICollectionReusableView {
  static let identifier = "ProfileInfoHeaderRV"
  
  public weak var delegate: ProfileInfoHeaderRVDelegate?
  
  private let profileImgView: UIImageView = {
    let profileImg = UIImageView()
    profileImg.backgroundColor = .red
    profileImg.layer.masksToBounds = true
    return profileImg
  }()
  
  private let postsBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("Posts", for: .normal)
    btn.setTitleColor(.label, for: .normal)
    btn.backgroundColor = .secondarySystemBackground
    return btn
  }()
  
  private let followersBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("Followers", for: .normal)
    btn.setTitleColor(.label, for: .normal)
    btn.backgroundColor = .secondarySystemBackground
    return btn
  }()
  
  private let followingBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("Following", for: .normal)
    btn.setTitleColor(.label, for: .normal)
    btn.backgroundColor = .secondarySystemBackground
    return btn
  }()
  
  private let editProfileBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("Edit your Profile", for: .normal)
    btn.setTitleColor(.label, for: .normal)
    btn.backgroundColor = .secondarySystemBackground
    return btn
  }()
  
  private let nameLbl: UILabel = {
    let lbl = UILabel()
    lbl.text = "Raaj Raza"
    lbl.textColor = .label
    lbl.numberOfLines = 1
    return lbl
  }()
  
  private let bioLbl: UILabel = {
    let lbl = UILabel()
    lbl.text = "Very First account!"
    lbl.textColor = .label
    lbl.numberOfLines = 0
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .systemBackground
    clipsToBounds = true
    addSubviews()
    addBtnActions()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let profilePhotoSize = width / 4
    profileImgView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
    profileImgView.layer.cornerRadius = profilePhotoSize / 2.0
    
    let btnHeight = profilePhotoSize / 2
    let countBtnWidth = (width - 10 - profilePhotoSize) / 3
    
    postsBtn.frame = CGRect(x: profileImgView.right, y: 5, width: countBtnWidth, height: btnHeight).integral
    followersBtn.frame = CGRect(x: postsBtn.right, y: 5, width: countBtnWidth, height: btnHeight).integral
    followingBtn.frame = CGRect(x: followersBtn.right, y: 5, width: countBtnWidth, height: btnHeight).integral
    editProfileBtn.frame = CGRect(x: profileImgView.right, y: 5 + btnHeight, width: countBtnWidth * 3, height: btnHeight).integral
    nameLbl.frame = CGRect(x: 5, y: 5 + profileImgView.bottom, width: width - 10, height: 50).integral
    
    let bioLblSize = bioLbl.sizeThatFits(frame.size)
    bioLbl.frame = CGRect(x: 5, y: 5 + nameLbl.bottom, width: width - 10, height: bioLblSize.height).integral
  }
  
  private func addSubviews() {
    addSubview(profileImgView)
    addSubview(followersBtn)
    addSubview(followingBtn)
    addSubview(postsBtn)
    addSubview(nameLbl)
    addSubview(bioLbl)
    addSubview(editProfileBtn)
  }
  
  private func addBtnActions() {
    postsBtn.addTarget(self, action: #selector(didTapPostsBtn), for: .touchUpInside)
    followersBtn.addTarget(self, action: #selector(didTapFollowersBtn), for: .touchUpInside)
    followingBtn.addTarget(self, action: #selector(didTapFollowingBtn), for: .touchUpInside)
    editProfileBtn.addTarget(self, action: #selector(didTapEditProfileBtn), for: .touchUpInside)
  }
  
  //MARK: - IBActions
  
  @objc func didTapPostsBtn() {
    delegate?.profileHeaderDidTapPostsBtn(self)
  }
  
  @objc func didTapFollowersBtn() {
    delegate?.profileHeaderDidTapFollowersBtn(self)
  }
  
  @objc func didTapFollowingBtn() {
    delegate?.profileHeaderDidTapFollowingBtn(self)
  }
  
  @objc func didTapEditProfileBtn() {
    delegate?.profileHeaderDidTapEditProfileBtn(self)
  }
  
}
