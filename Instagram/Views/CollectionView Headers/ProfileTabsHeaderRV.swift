//
//  ProfileTabsHeaderRV.swift
//  Instagram
//
//  Created by Mag isb-10 on 30/07/2024.
//

import UIKit

protocol ProfileTabsHeaderRVDelegate: AnyObject {
  func didTapGridBtnTab()
  func didTapTaggedBtnTab()
}

class ProfileTabsHeaderRV: UICollectionReusableView {
  static let identifier = "ProfileTabsHeaderRV"
  
  public weak var delegate: ProfileTabsHeaderRVDelegate?
  
  struct Constants {
    static let padding: CGFloat = 8
  }
  
  private let gridBtn: UIButton = {
    let btn = UIButton()
    btn.clipsToBounds = true
    btn.tintColor = .white
    btn.setBackgroundImage(UIImage(systemName: "square.grid.3x3.fill"), for: .normal)
    return btn
  }()
  
  private let taggedBtn: UIButton = {
    let btn = UIButton()
    btn.clipsToBounds = true
    btn.tintColor = .lightGray
    btn.setBackgroundImage(UIImage(systemName: "tag.fill"), for: .normal)
    return btn
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .systemBackground
    addSubview(gridBtn)
    addSubview(taggedBtn)
    
    gridBtn.addTarget(self, action: #selector(didTapGridBtnTab), for: .touchUpInside)
    taggedBtn.addTarget(self, action: #selector(didTapTaggedBtnTab), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let size = height - (Constants.padding * 2)
    let gridBtnX = ((width / 2) - size) / 2
    
    gridBtn.frame = CGRect(x: gridBtnX, y: Constants.padding, width: size, height: size)
    taggedBtn.frame = CGRect(x: gridBtnX + (width / 2), y: Constants.padding, width: size, height: size)
  }
  
  @objc func didTapGridBtnTab() {
    gridBtn.tintColor = .white
    taggedBtn.tintColor = .lightGray
    delegate?.didTapGridBtnTab()
  }
  
  @objc func didTapTaggedBtnTab() {
    gridBtn.tintColor = .lightGray
    taggedBtn.tintColor = .white
    delegate?.didTapTaggedBtnTab()
  }
  
}
