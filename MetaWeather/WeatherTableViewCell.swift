//
//  WeatherTableViewCell.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    let imageUrl = "https://www.metaweather.com/static/img/weather/png/"
    let iconExt = ".png"
    var dateLabel: UILabel!
    var weatheLabel: UILabel!
    var weatherState: UIImageView!
    var maxTmpLabel: UILabel!
    var minTmpLabel: UILabel!

    var item: Consolidated_weather! {
        didSet{
           loadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        drawView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherTableViewCell{
    func drawView(){
        
        dateLabel = UILabel.Builder().withOfSize(14).withWeight(.regular).withTextAligment(.left).withTextColor(.darkGray).build()
        self.addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
   
        weatherState = UIImageView.Builder().build()
        self.addSubview(weatherState)
        weatherState.widthAnchor.constraint(equalToConstant: 64).isActive = true
        weatherState.heightAnchor.constraint(equalToConstant: 64).isActive = true
        weatherState.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        weatherState.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        weatherState.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        weatheLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.left).withTextColor(.darkGray).build()
        self.addSubview(weatheLabel)
        weatheLabel.leftAnchor.constraint(equalTo: weatherState.rightAnchor, constant: 5).isActive = true
        weatheLabel.bottomAnchor.constraint(equalTo: weatherState.bottomAnchor, constant: 0).isActive = true
       
        minTmpLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.right).withTextColor(.darkGray).build()
        self.addSubview(minTmpLabel)
        minTmpLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        minTmpLabel.centerYAnchor.constraint(equalTo: weatherState.centerYAnchor, constant: 0).isActive = true
        
        maxTmpLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.right).withTextColor(.darkGray).build()
        self.addSubview(maxTmpLabel)
        maxTmpLabel.rightAnchor.constraint(equalTo: minTmpLabel.leftAnchor, constant: -10).isActive = true
        maxTmpLabel.centerYAnchor.constraint(equalTo: minTmpLabel.centerYAnchor, constant: 0).isActive = true
        
    }
    
    func loadData(){
        dateLabel.text = item.applicable_date.toEEEddMM()
        weatheLabel.text = item.weather_state_name
        guard let iconUrl = URL(string: imageUrl + item.weather_state_abbr + iconExt) else{
            fatalError("fail to create uri")
        }
        weatherState.load(url: iconUrl)
        minTmpLabel.text = "Min: \(Int(item.min_temp)) °C"
        maxTmpLabel.text = "Max: \(Int(item.max_temp)) °C"
       
    }
}
