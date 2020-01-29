//
//  Consolidated_weather.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//  https://www.metaweather.com/api/

import UIKit
struct MetaWeatherModel: Codable {
    let consolidated_weather: [Consolidated_weather]
    let time: String
    let sun_rise: String
    let sun_set: String
    let timezone_name: String
    let parent: Parent
    let sources: [Sources]
    let title: String
    let location_type: String
    let woeid: Int
    let latt_long: String
    let timezone: String
}
struct Consolidated_weather: Codable {
    let id: Int
    let weather_state_name: String
    let weather_state_abbr: String
    let wind_direction_compass: String
    let created: String
    let applicable_date: String
    let min_temp: Float
    let max_temp: Float
    let the_temp: Float
    let wind_speed: Double
    let wind_direction: Double
    let air_pressure: Float
    let humidity: Int
    let visibility: Double
    let predictability: Int
}

struct Parent: Codable {
    let title: String
    let location_type: String
    let woeid: Int
    let latt_long: String
}

struct Sources: Codable {
    let title: String
    let slug: String
    let url: String
    let crawl_rate: Int
}
