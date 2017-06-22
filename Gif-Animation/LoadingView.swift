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
        view = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
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
        view = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 170.0))
        view?.backgroundColor = UIColor.init(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        view?.center = CGPoint(x: UIScreen.main.bounds.width / 2.0, y: UIScreen.main.bounds.height / 2.0)
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
        view = UIImageView(image: UIImage.animatedImage(withAnimatedGIFData: try! Data.init(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "loading_animation", ofType: "gif")!))))
        view?.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 170.0)
        view?.backgroundColor = UIColor.clear
        view?.contentMode = UIViewContentMode.scaleAspectFit
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
    let window = UIApplication.shared.windows.last
    let view = loadingAnimationView()
    window?.addSubview(view)
    
    view.alpha = 1.0
    UIView.animate(withDuration: 0.3, animations: { 
      view.alpha = 1.0
    }) 
  }
  
  func stopLoadingAnimation() {
    print("stopLoadingAnimation")
    unowned let unownedSelf = self
    UIView.animate(withDuration: 0.3, animations: {
      unownedSelf.backgroundView?.alpha = 0.0
    }) 
  }
  
  fileprivate func loadingAnimationView() -> UIView {
    loadingView?.addSubview(animationView!)
    backgroundView?.addSubview(loadingView!)
    return backgroundView!
  }
  
}
