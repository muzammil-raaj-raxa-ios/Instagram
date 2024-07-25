//
//  ProfileVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

class ProfileVC: UIViewController {
  
  private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = UIColor.systemBackground
      configureNavigationBar()
      
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      layout.itemSize = CGSize(width: view.width/3, height: view.width/3)
//      collectionView?.delegate = self
//      collectionView?.dataSource = self
      collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      
      guard let collectionView = collectionView else {
        return
      }
      view.addSubview(collectionView)
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


//extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    
//  }
//  
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//  }
//  
//  
//}
