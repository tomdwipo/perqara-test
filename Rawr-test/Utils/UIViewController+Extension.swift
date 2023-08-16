//
//  UIViewController+Extension.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

extension UIViewController {
    func directToDetailPage(id: String){
        let detail = DetailViewController()
        detail.id = id
        detail.modalTransitionStyle = .crossDissolve
        detail.modalPresentationStyle = .fullScreen
        self.present(detail, animated: true)
    }
}
