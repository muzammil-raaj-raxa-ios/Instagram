//
//  ProfileVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

final class ProfileVC: UIViewController {
  
  private var collectionView: UICollectionView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    configureNavigationBar()
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
    let size = (view.width - 4) / 3
    layout.itemSize = CGSize(width: size, height: size)
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.backgroundColor = .red
    
    collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)

    collectionView?.register(ProfileInfoHeaderRV.self,
                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                             withReuseIdentifier: ProfileInfoHeaderRV.identifier)
    collectionView?.register(ProfileTabsHeaderRV.self,
                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                             withReuseIdentifier: ProfileTabsHeaderRV.identifier)
    
    
    
    guard let collectionView = collectionView else {
      return
    }
    view.addSubview(collectionView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    collectionView?.frame = view.bounds
  }
  
  private func configureNavigationBar() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "gear"),
      style: .done,
      target: self,
      action: #selector(didTapSettingsBtn)
    )
    navigationItem.rightBarButtonItem?.tintColor = UIColor.label
  }
  
  @objc private func didTapSettingsBtn() {
    let vc = SettingsVC()
    vc.title = "Settings"
    navigationController?.pushViewController(vc, animated: true)
  }
  
}


extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
    cell.configure(debug: "test")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
  }
  
}
