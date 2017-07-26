//
//  VariableExtension.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/05/30.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import RxSwift

extension Variable {
    func asShareReplayLatest() -> Observable<E> {
        return asObservable().shareReplayLatestWhileConnected()
    }
}
