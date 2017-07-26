//
//  NSObjectProtocolExtension.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/06/01.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    static var className: String {
        let className = NSStringFromClass(self)
        guard let range = className.range(of: ".") else {
            log?.debug("guard")
            return ""
        }
        return className.substring(from: range.upperBound)
    }
}
