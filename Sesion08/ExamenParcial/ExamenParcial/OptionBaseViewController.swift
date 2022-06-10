//
//  OptionBaseViewController.swift
//  ExamenParcial
//
//  Created by Kenyi Rodriguez on 10/06/22.
//

import UIKit

class OptionBaseViewController: UIViewController {
    @IBAction private func clickBtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
