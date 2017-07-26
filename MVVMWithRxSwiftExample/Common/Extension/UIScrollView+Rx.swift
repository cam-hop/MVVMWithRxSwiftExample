//
//  UIScrollView+Rx.swift
//  akb48mail_ios
//
//  Created by 小川 竜太 on 2017/07/07.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIScrollView {
    var reachedBottom: ControlEvent<Void> {
        let observable = contentOffset
            .flatMap { [weak base] contentOffset -> Observable<Void> in
                guard let scrollView = base else {
                    log?.debug("guard")
                    return Observable.empty()
                }

                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)

                return y > threshold ? Observable.just() : Observable.empty()
        }

        return ControlEvent(events: observable)
    }
}
