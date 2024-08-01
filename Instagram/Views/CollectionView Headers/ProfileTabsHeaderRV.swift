//
//  ProfileTabsHeaderRV.swift
//  Instagram
//
//  Created by Mag isb-10 on 30/07/2024.
//

import UIKit

class ProfileTabsHeaderRV: UICollectionReusableView {
  static let identifier = "ProfileTabsHeaderRV"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .systemBackground
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
