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
        view = UIView.init(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetHeight(UIScreen.mainScreen().bounds)))
        view?.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        self.backgroundView = view
      }
      return view
    }
    set(newValue) {
      objc_setAssociatedObject(self, &backgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  var loadingView: UIView? {
    get {
      var view = objc_getAssociatedObject(self, &loadingViewKey) as? UIView
      if view == nil {
        view = UIView.init(frame: CGRectMake(0.0, 0.0, 204.0, 167.0))
        view?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        view?.center = CGPointMake(CGRectGetWidth(UIScreen.mainScreen().bounds) / 2.0, CGRectGetHeight(UIScreen.mainScreen().bounds) / 2.0)
        view?.layer.cornerRadius = 13.0
        self.loadingView = view
      }
      return nil
    }
    set(newValue) {
      objc_setAssociatedObject(self, &loadingViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  func startLoadingAnimation() {
    print("startLoadingAnimation")
  }
  
  func stopLoadingAnimation() {
    print("stopLoadingAnimation")
  }
  
}
