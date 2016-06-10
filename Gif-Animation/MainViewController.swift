//
//  MainViewController.swift
//  Gif-Animation
//
//  Created by HenryFan on 7/6/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Gategory reference : https://github.com/mayoff/uiimage-from-animated-gif
    // Gif reference : http://www.huhmagazine.co.uk/9134/incredibly-satisfying-gifs-by-florian-de-looij
    
    stopIt()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    startLoadingAnimation()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: Private
  
  private func stopIt() {
    let interval = 3.0
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * NSTimeInterval(NSEC_PER_SEC)))
    unowned let unownedSelf = self
    dispatch_after(delay, dispatch_get_main_queue()) { 
      unownedSelf.stopLoadingAnimation()
    }
  }
  
}
