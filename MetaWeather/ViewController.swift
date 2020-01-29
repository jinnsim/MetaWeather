//
//  ViewController.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         let api = MetaWetherAPI(woeid: 1132599)
         NetworkHelper.shared.requestApi(MetaWeatherModel.self, url: api.url) { (result) in
                   print(result) 
         }
    }


}

