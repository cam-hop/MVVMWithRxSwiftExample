//
//  CellNibable.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/06/01.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit

protocol CellNibable: Nibable {
    static var identifier: String { get }
}

extension CellNibable {
    static var identifier: String {
        return className
    }
}

extension UITableViewCell: CellNibable {}
extension UICollectionReusableView: CellNibable {}
