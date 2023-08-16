//
//  ViewController.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = HomeController()
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.view.setConstraint(to: self.view)
    }
}
