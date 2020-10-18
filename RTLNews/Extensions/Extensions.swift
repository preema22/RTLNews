//
//  Extensions.swift
//  RTLNews
//
//  Created by Preema DSouza on 16/10/2020.
//  Copyright © 2020 Preema DSouza. All rights reserved.
//

import UIKit

///Extensions
extension UILabel {
    convenience init(font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension Date {
    func serviceFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: self)
    }
}
