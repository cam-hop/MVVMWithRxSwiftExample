//
//  StringExtension.swift
//  akb48mail_ios
//
//  Created by DUONG VANHOP on 2017/06/23.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

extension String {
    var capitalizeFirst: String {
        var result = [Character](self.characters)
        if let first = result.first { result[0] = Character(String(first).uppercased()) }
        return String(result)
    }
}
