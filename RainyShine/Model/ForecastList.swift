//
//  ForeCastList.swift
//  RainyShine
//
//  Created by Kimia Yazdani on 6/28/23.
//

import UIKit
import Alamofire


class ForecastList {
    var _forecasts = [Forecast]()

    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        let forecastURL = URL(string: FORECAST_WEATHER_URL)!
        
        print(FORECAST_WEATHER_URL)
        AF.request(forecastURL).responseJSON { response in
            if let dict = response.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self._forecasts.append(forecast)
                    }
                }
            }
            completed()
        }
    }
    
}
