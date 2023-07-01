//
//  Forecast.swift
//  RainyShine
//
//  Created by Kimia Yazdani on 6/28/23.
//

import UIKit
import Alamofire

class Forecast {
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let minTemp = temp["temp_min"] as? Double {
                let kelvinToFarenheitPreDivision = minTemp * (9/5) - 459.67
                let kelvinToFarenheit = Double(round(10*kelvinToFarenheitPreDivision/10))
                self._lowTemp = "\(kelvinToFarenheit)"

            }
            if let maxTemp = temp["temp_max"] as? Double {
                let kelvinToFarenheitPreDivision = maxTemp * (9/5) - 459.67
                let kelvinToFarenheit = Double(round(10*kelvinToFarenheitPreDivision/10))
                self._highTemp = "\(kelvinToFarenheit)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
//            dateFormatter.dateFormat = "EEEE"
            dateFormatter.dateFormat = "EEEE, h:mm a"
//            dateFormatter.timeStyle = .short
//            self._date = unixConvertedDate.dayOfTheWeek()
            self._date = dateFormatter.string(from: unixConvertedDate)
            
        }  

    }
    
    
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
