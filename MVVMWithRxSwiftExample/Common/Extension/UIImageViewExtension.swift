//
//  UIImageViewExtension.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/06/02.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    /// Set image by Kingfisher
    ///
    /// - Parameter url: type of the event
    public func setImageKf(with url: URL) {

        self.kf.setImage(with: url,
                         placeholder: UIImage(named: "noimage"),
                         options: nil,
                         progressBlock: { receivedSize, totalSize in
                            log?.debug("\(receivedSize)/\(totalSize)")},
                         completionHandler: { _, _, _, _ in
        })
    }
}
