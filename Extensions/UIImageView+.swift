//
//  UIImageView+.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

extension UIImageView{
    typealias Builder = UIImageViewBuilder
 
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
class UIImageViewBuilder: BuilderType{
    var contentMode: UIView.ContentMode = .scaleAspectFill
    
    func withContentMode(_ contentMode: UIView.ContentMode) -> UIImageViewBuilder{
        self.contentMode = contentMode
        return self
    }
    
    func build() -> UIImageView {
        let imageView = UIImageView()
        imageView.accessibilityIgnoresInvertColors = true
        imageView.contentMode = self.contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
