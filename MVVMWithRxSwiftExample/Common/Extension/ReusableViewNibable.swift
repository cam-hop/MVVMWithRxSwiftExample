//
//  ReusableViewNibable.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/06/01.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit

protocol ReusableViewNibable: Nibable {
    static var identifier: String { get }
}

extension ReusableViewNibable {
    static var identifier: String {
        return className
    }
}

extension UITableViewHeaderFooterView: ReusableViewNibable {}
