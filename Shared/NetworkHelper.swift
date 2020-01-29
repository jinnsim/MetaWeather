//
//  NetworkHelper.swift
//  MetaWeather
//
//  Created by iOS_seok on 2020/01/29.
//  Copyright © 2020 FP. All rights reserved.
//

import UIKit

enum Result<T>{
    case success(T)
    case error
}

class NetworkHelper: NSObject {
  static let shared = NetworkHelper()
}

extension NetworkHelper{
    func requestApi<T: Codable>(_ target: T.Type,url: String, handler: @escaping (Result<T>) -> Void )  {
        guard let url = URL(string: url) else {
            return handler(.error)
        }
        let urlRequest = URLRequest(url: url,
                                          cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData,
                                          timeoutInterval: TimeInterval.init(exactly: 10) ?? 0)
        URLSession.shared.dataTask(with: urlRequest) { (data, response,error) in
            guard let encoded = data else{
                return handler(.error)
            }
            do {
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode(T.self, from: encoded)
                handler(.success(parsedData))
            }catch let err{
                print(err)
                return handler(.error)
            }
            
            
        }.resume()
    }
}
