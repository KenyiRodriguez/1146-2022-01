//
//  AppNavigationController.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 1/07/22.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [MoviesTabBarController.build()]
    }
}
