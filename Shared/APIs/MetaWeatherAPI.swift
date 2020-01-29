//
//  MetaWeatherAPI.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit


struct MetaWetherAPI{
    
    let woeid: Int
    public init(woeid: Int) {
        self.woeid = woeid
    }
    
    var method: String = "GET"
    var url: String {
        return "https://www.metaweather.com/api/location/\(woeid)/"
    }
}
