//
//  ColorsMap.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexRGB: Int, alpha: CGFloat = 1) {
        let rgb = (
            CGFloat((hexRGB & 0xFF0000) >> 16) / 255,
            CGFloat((hexRGB & 0xFF00) >> 8) / 255,
            CGFloat(hexRGB & 0xFF) / 255
        )
        self.init(red: rgb.0, green: rgb.1, blue: rgb.2, alpha: alpha)
    }
}

struct ColorsMap {
    static let redColor = UIColor(hexRGB: 0xf0141e)
    static let lightGrayColor = UIColor(hexRGB: 0xe9e9e9)
    static let grayColor = UIColor(hexRGB: 0x858585)
}
