//
//  ExploreVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

class ExploreVC: UIViewController {
  
  private let searchBar: UISearchBar = {
    let searchbar = UISearchBar()
    searchbar.backgroundColor = UIColor.secondarySystemBackground
    return searchbar
  }()
  
  private var collectionview: UICollectionView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.systemBackground
    navigationController?.navigationBar.topItem?.titleView = searchBar
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    collectionview?.delegate = self
    collectionview?.dataSource = self
    collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
    guard let collectionview = collectionview else {
      return
    }
    view.addSubview(collectionview)
  }
  
}

extension ExploreVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
}
