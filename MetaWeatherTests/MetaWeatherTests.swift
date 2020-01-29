//
//  MetaWeatherTests.swift
//  MetaWeatherTests
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import XCTest
@testable import MetaWeather

class MetaWeatherTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 
    
    func testNetworkApi(){
        assert(NetworkHelper.shared.classForCoder == NetworkHelper.classForCoder())
        
         let api = MetaWetherAPI(woeid: 1132599)
        assert(api.url == "https://www.metaweather.com/api/location/1132599/", api.url)
      
    }

    
}
