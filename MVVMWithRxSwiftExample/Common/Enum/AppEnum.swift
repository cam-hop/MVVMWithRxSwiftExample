//
//  AppEnum.swift
//  MVVMWithRxSwiftExample
//
//  Created by DUONG VANHOP on 2017/07/26.
//  Copyright © 2017年 Duong Van Hop. All rights reserved.
//

import Foundation

// MARK: Storyboard
// All created storyboards must be defined here
enum Storyboard: String {
    case main

    var fileName: String {
        return rawValue.capitalizeFirst
    }
}
