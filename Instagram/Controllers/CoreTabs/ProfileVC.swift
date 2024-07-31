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
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 0
    }
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
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    guard kind == UICollectionView.elementKindSectionHeader else {
      return UICollectionReusableView()
    }
    
    if indexPath.section == 1 {
      let tabControlHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileTabsHeaderRV.identifier, for: indexPath) as! ProfileTabsHeaderRV
      
      return tabControlHeader
    }
    
    let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileInfoHeaderRV.identifier, for: indexPath) as! ProfileInfoHeaderRV
    
    return profileHeader
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 {
      return CGSize(width: collectionView.width, height: collectionView.height / 3)
    }
    
    return CGSize(width: collectionView.width, height: 65)

  }
  
}
