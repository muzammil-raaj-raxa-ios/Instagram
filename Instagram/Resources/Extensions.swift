//
//  Extensions.swift
//  Instagram
//
//  Created by Mag isb-10 on 23/07/2024.
//

import UIKit

extension UIView {
  
  public var width: CGFloat {
    return frame.size.width
  }
  
  public var height: CGFloat {
    return frame.size.height
  }
  
  public var top: CGFloat {
    return frame.origin.y
  }
  
  public var bottom: CGFloat {
    return frame.origin.y + frame.size.height
  }
  
  public var left: CGFloat {
    return frame.origin.x
  }
  
  public var right: CGFloat {
    return frame.origin.x + frame.size.width
  }
  
}