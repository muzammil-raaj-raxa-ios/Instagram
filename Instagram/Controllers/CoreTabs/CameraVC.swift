//
//  CameraVC.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  private func didTapMakePost() {
    print("didTapMakePost Tapped")
  }
  
}
