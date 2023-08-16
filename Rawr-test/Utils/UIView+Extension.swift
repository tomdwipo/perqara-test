//
//  UIView+Extension.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit


extension UIView {
    
    func setConstraint(to container: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
    }
    
    func setImageFromStringrURL(stringUrl: String, result:@escaping (_ image: Data)->Void) {
      if let url = URL(string: stringUrl) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          guard let imageData = data else { return }
          DispatchQueue.main.async {
            result(imageData)
          }
        }.resume()
      }
    }

}

