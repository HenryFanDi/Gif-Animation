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
        view = UIView.init(frame: CGRectMake(0.0, 0.0, 200.0, 170.0))
        view?.backgroundColor = UIColor.init(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        view?.center = CGPointMake(CGRectGetWidth(UIScreen.mainScreen().bounds) / 2.0, CGRectGetHeight(UIScreen.mainScreen().bounds) / 2.0)
        view?.layer.cornerRadius = 13.0
        self.loadingView = view
      }
      return view
    }
    set(newValue) {
      objc_setAssociatedObject(self, &loadingViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  var animationView: UIImageView? {
    get {
      var view = objc_getAssociatedObject(self, &animationViewKey) as? UIImageView
      if view == nil {
        view = UIImageView(image: UIImage.animatedImageWithAnimatedGIFData(NSData.init(contentsOfFile: NSBundle.mainBundle().pathForResource("loading_animation", ofType: "gif")!)!))
        view?.frame = CGRectMake(0.0, 0.0, 200.0, 170.0)
        view?.backgroundColor = UIColor.clearColor()
        view?.contentMode = UIViewContentMode.ScaleAspectFit
        view?.clipsToBounds = true
        self.animationView = view
      }
      return view
    }
    set(newValue) {
      objc_setAssociatedObject(self, &animationViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  func startLoadingAnimation() {
    print("startLoadingAnimation")
    let window = UIApplication.sharedApplication().windows.last
    let view = loadingAnimationView()
    window?.addSubview(view)
    
    view.alpha = 1.0
    UIView.animateWithDuration(0.3) { 
      view.alpha = 1.0
    }
  }
  
  func stopLoadingAnimation() {
    print("stopLoadingAnimation")
    unowned let unownedSelf = self
    UIView.animateWithDuration(0.3) {
      unownedSelf.backgroundView?.alpha = 0.0
    }
  }
  
  private func loadingAnimationView() -> UIView {
    loadingView?.addSubview(animationView!)
    backgroundView?.addSubview(loadingView!)
    return backgroundView!
  }
  
}
