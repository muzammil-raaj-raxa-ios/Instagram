//
//  PhotoCell.swift
//  Instagram
//
//  Created by Mag isb-10 on 30/07/2024.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
  static let identifier = "PhotoCell"
  
  private let photoImgView: UIImageView = {
    let imgView = UIImageView()
    imgView.clipsToBounds = true
    imgView.contentMode = .scaleAspectFill
    return imgView
  }()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    photoImgView.frame = contentView.bounds
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    photoImgView.image = nil
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  
    contentView.backgroundColor = .secondarySystemBackground
    contentView.addSubview(photoImgView)
    contentView.clipsToBounds = true
    accessibilityLabel = "User Post Image"
    accessibilityHint = "Double-tap to open post"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func configure(with model: UserPost) {
    let url = model.thumbnailImg
    photoImgView.sd_setImage(with: url, completed: nil)
  }
  
  public func configure(debug imageName: String) {
    photoImgView.image = UIImage(named: imageName)
  }
  
}
