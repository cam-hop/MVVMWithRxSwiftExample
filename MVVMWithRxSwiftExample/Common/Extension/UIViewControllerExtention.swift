//
//  UIViewControllerExtention.swift
//  akb48mail_ios
//
//  Created by DUONG VANHOP on 2017/06/20.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit

extension UIViewController: StoryboardIdentifiable { }

// MARK: Modal ViewController SetUp
extension UIViewController {

    func setCloseNavigationItem() {
        let leftCloseButton = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(self.pushCloseButton(_:)))
        navigationItem.leftBarButtonItem = leftCloseButton
    }

    func pushCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
