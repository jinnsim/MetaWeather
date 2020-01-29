//
//  BuilderProtocol.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

protocol BuilderType {
    associatedtype builder
    func build() -> builder
}
