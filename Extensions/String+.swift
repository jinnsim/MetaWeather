//
//  String+.swift
//  MetaWeather
//
//  Created by jongjin seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

extension String{
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
      let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = format
      guard let date = dateFormatter.date(from: self) else {
        preconditionFailure("check format")
      }
      return date
    }
    
    func toEEEddMM() -> String { 
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, d MMM"
        return dateFormatter.string(from: self.toDate())
    }
}

