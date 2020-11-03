//
//  UIView+Ext.swift
//  FaveMovies
//
//  Created by Ahmad on 02/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBlurEffectView(view:UIView, alpha: CGFloat = 0.20) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = alpha
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurEffectView, at: 0)
    }
}
