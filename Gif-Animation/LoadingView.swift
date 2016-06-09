//
//  LoadingView.swift
//  Gif-Animation
//
//  Created by HenryFan on 9/6/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import Foundation
import ObjectiveC

private var backgroundViewKey = "backgroundViewKey"
private var loadingViewKey = "loadingViewKey"
private var animationViewKey = "animationViewKey"

extension UIViewController {
  
  var backgroundView: UIView? {
    get {
      var view = objc_getAssociatedObject(self, &backgroundViewKey) as? UIView
      if view == nil {
        view = UIView.init()
        view?.backgroundColor = UIColor.blackColor()
        self.backgroundView = view
      }
      return view
    }
    set(newValue) {
      objc_setAssociatedObject(self, &backgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  func startLoadingAnimation() {
    print("startLoadingAnimation")
  }
  
  func stopLoadingAnimation() {
    print("stopLoadingAnimation")
  }
  
}
