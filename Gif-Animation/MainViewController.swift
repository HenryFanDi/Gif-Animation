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
    
//    stopLoadingAnimation()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    startLoadingAnimation()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
