//
//  HomeViewController.swift
//  Constraints
//
//  Created by Kenyi Rodriguez on 6/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var anchorHeight: NSLayoutConstraint!
    
    @IBAction func clickBtnAnimate(_ sender: UIButton) {
        
        let newHeight = CGFloat.random(in: 100...500)
        
        UIView.animate(withDuration: 0.5) {
            self.anchorHeight.constant = newHeight
            self.view.layoutIfNeeded()
        }
    }
}
