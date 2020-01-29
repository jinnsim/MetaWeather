//
//  WeatherTableViewCell.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    var weatheLabel: UILabel!
    var weatherState: UIImageView!
    var imageUrl = "https://www.metaweather.com/static/img/weather/png/"
    var item: Consolidated_weather! {
        didSet{
           loadData()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherTableViewCell{
    func drawView(){
        
        weatheLabel = UILabel.Builder().withOfSize(12).withWeight(.regular).withTextAligment(.left).withTextColor(.darkGray).build()
        self.addSubview(weatheLabel)
        weatheLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        weatheLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        weatherState = UIImageView.Builder().build()
        self.addSubview(weatherState)
        weatherState.widthAnchor.constraint(equalToConstant: 64).isActive = true
        weatherState.heightAnchor.constraint(equalToConstant: 64).isActive = true
        weatherState.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        weatherState.topAnchor.constraint(equalTo: weatheLabel.bottomAnchor, constant: 2).isActive = true
        weatherState.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
       
    }
    
    func loadData(){
         weatheLabel.text = item.weather_state_name
         
    }
}
