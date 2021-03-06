//
//  UIViewExtension.swift
//  akb48mail_ios
//
//  Created by DUONG VAN HOP on 2017/06/01.
//  Copyright © 2017年 DUONG VANHOP. All rights reserved.
//

import UIKit

extension UIView {

    var interactionEnabled: Bool {
        return alpha >= 1 && isHidden == false && isUserInteractionEnabled
    }

    // exp: view.roundedCorners([.TopRight, .TopLeft], radius: 10)
    func roundedCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        let size = CGSize(width: radius, height: radius)
        maskLayer.frame = bounds
        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size).cgPath

        layer.mask = maskLayer
    }

    func createImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            log?.debug("guard")
            return nil
        }
        context.translateBy(x: -bounds.origin.x, y: -bounds.origin.y)
        layer.render(in: context)
        defer {
            UIGraphicsEndImageContext()
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func viewFromNib() -> UIView {
        let nib = UINib(nibName: self.className, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            log?.debug("guard")
            return UIView()
        }
        return view
    }

//    func setConstrainEdges(_ targetView: UIView) {
//        constrain(targetView, self) { targetView, view in
//            targetView.edges == view.edges
//        }
//    }
//
//    func addConstrainEdges(_ view: UIView) {
//        addSubview(view)
//        constrain(view, self) { view, superview in
//            view.edges == superview.edges
//        }
//    }
//
//    func insertConstrainEdges(_ view: UIView, atIndex index: Int) {
//        insertSubview(view, at: index)
//        constrain(view, self) { view, superview in
//            view.edges == superview.edges
//        }
//    }

//    func insertConstrainEdges(_ view: UIView, belowSubview siblingSubview: UIView) {
//        insertSubview(view, belowSubview: siblingSubview)
//        constrain(view, self) { view, superview in
//            view.edges == superview.edges
//        }
//    }

}

extension UIView {
    class func animateWithDuration(_ duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions = [], animations: @escaping () -> Void) {
        animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: nil)
    }

    class func animateWithDuration(_ duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIViewAnimationOptions = [], animations: @escaping () -> Void) {
        animate(withDuration: duration, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: options, animations: animations, completion: nil)
    }
}
