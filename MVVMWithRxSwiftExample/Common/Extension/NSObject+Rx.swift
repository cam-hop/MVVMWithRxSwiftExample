//
//  NSObject+Rx.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/05/30.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import Foundation
import RxSwift
import ObjectiveC

public extension NSObject {
    fileprivate struct AssociatedKeys {
        static var DisposeBag = "rx_disposeBag"
    }

    fileprivate func doLocked(_ closure: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        closure()
    }

    var rxDisposeBag: DisposeBag {
        get {
            var disposeBag: DisposeBag!
            doLocked {
                let lookup = objc_getAssociatedObject(self, &AssociatedKeys.DisposeBag) as? DisposeBag
                if let lookup = lookup {
                    disposeBag = lookup
                } else {
                    let newDisposeBag = DisposeBag()
                    self.rxDisposeBag = newDisposeBag
                    disposeBag = newDisposeBag
                }
            }
            return disposeBag
        }

        set {
            doLocked {
                objc_setAssociatedObject(self, &AssociatedKeys.DisposeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
