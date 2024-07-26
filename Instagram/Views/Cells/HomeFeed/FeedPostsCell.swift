//
//  FeedPostsCell.swift
//  Instagram
//
//  Created by Mag isb-10 on 26/07/2024.
//

import UIKit

final class FeedPostsCell: UITableViewCell {
  
  static let identifier = "FeedPostsCell"

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure() {
    
  }
  
}
