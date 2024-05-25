//
//  Extensions.swift
//  currency_app
//
//  Created by Pavel Barto on 25.05.2024.
//

import UIKit

extension UIView {
    func applyBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
