//
//  UILabel+.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

extension UILabel{
    typealias Builder = UILabelBuilder
}
class UILabelBuilder: BuilderType {
    var ofSize: CGFloat!
    var weight: UIFont.Weight!
    var textAligment: NSTextAlignment!
    var textColor: UIColor!
    
    func withOfSize(_ ofSize: CGFloat) -> UILabelBuilder{
        self.ofSize = ofSize
        return self
    }
    
    func withWeight(_ weight: UIFont.Weight) -> UILabelBuilder {
        self.weight = weight
        return self
    }
    
    func withTextAligment(_ textAligment: NSTextAlignment) -> UILabelBuilder{
        self.textAligment = textAligment
        return self
    }
    
    func withTextColor(_ textColor: UIColor) -> UILabelBuilder{
        self.textColor = textColor
        return self
    }
    
    func build() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: self.ofSize, weight: self.weight)
        label.textAlignment = self.textAligment
        label.textColor = self.textColor
        return label
    }
}
