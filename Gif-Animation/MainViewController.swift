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
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    startLoadingAnimation()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: Private
  
  fileprivate func stopIt() {
    let interval = 3.0
    let delay = DispatchTime.now() + Double(Int64(interval * TimeInterval(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    unowned let unownedSelf = self
    DispatchQueue.main.asyncAfter(deadline: delay) { 
      unownedSelf.stopLoadingAnimation()
    }
  }
  
}
