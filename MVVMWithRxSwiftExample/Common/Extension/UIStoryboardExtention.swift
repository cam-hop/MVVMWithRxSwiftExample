//
//  UIStoryboardExtention.swift
//  akb48mail_ios
//
//  Created by DUONG VANHOP on 2017/06/20.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.fileName, bundle: bundle)
    }

    class func storyboad(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.fileName, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>() -> T? where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            // fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
            // Couldn't instantiate view controller
            log?.debug("guard")
            return nil
        }

        return viewController
    }
}
