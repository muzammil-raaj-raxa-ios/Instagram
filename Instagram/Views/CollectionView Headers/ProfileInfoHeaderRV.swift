//
//  ProfileInfoHeaderRV.swift
//  Instagram
//
//  Created by Mag isb-10 on 30/07/2024.
//

import UIKit

class ProfileInfoHeaderRV: UICollectionReusableView {
  static let identifier = "ProfileInfoHeaderRV"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .systemBlue
    clipsToBounds = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
