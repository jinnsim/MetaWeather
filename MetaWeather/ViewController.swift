//
//  ViewController.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//
//  https://www.metaweather.com/api/location/search/?query=london

import UIKit

class ViewController: UIViewController {
    let cities = [1132599,44418,2379574] //Seoul,London,Chicago
    let weekDays = 6
    var tableView: UITableView!
    var weathers: [MetaWeatherModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
         
    }
 
}

extension ViewController{
    func drawView(){
        tableView = UITableView.Builder().withDataSource(self).withDelegate(self).withEstimatedRowHeight(100).build()
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
        self.view.addSubview(tableView)
        tableView.fillToSuperView()
      
            for woeid in cities{
                autoreleasepool {
                 let api = MetaWetherAPI(woeid: woeid)
                 requestData(api) 
                }
            }
    }
}

extension ViewController: UITableViewDelegate{
    func requestData(_ api: MetaWetherAPI){
        NetworkHelper.shared.requestApi(MetaWeatherModel.self, url: api.url) { [weak self] (result) in
           switch result{
           case .error:
               print(result)
           case .success(let decoded):
               self?.weathers.append(decoded)
               DispatchQueue.main.async {
                self?.tableView.reloadData()
               }
               
           }
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard weathers.count > section else {
            return nil
        }
        return weathers[section].title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return weathers.count > 0 ? weathers.count : 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard weathers.count > section else {
            return 0
        }
        return weathers[section].consolidated_weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else {
            fatalError("fail to cast")
        }
         let item = weathers[indexPath.section].consolidated_weather[indexPath.row]
        cell.item = item
        
        return cell
    }
    
    
}

