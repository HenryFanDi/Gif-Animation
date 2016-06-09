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
    
    // Reference : https://github.com/mayoff/uiimage-from-animated-gif
    
    startLoadingAnimation()
    stopLoadingAnimation()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
