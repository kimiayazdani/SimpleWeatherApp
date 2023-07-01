//
//  WeatherCell.swift
//  RainyShine
//
//  Created by Kimia Yazdani on 6/28/23.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var weatherIconImg: UIImageView!
    
    
    func configureCell(forecast: Forecast) {
        lowTempLbl.text = forecast.lowTemp
        highTempLbl.text = forecast.highTemp
        dayLbl.text = forecast.date
        weatherLbl.text = forecast.weatherType
        weatherIconImg.image = UIImage(named: "\(forecast.weatherType) Mini")
    }

}
