//
//  ViewController.swift
//  RainyShine
//
//  Created by Kimia Yazdani on 6/27/23.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var currentWeather: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var weatherTableView: UITableView!
    
    var currentWeatherDet: CurrentWeather!
    var forecastList: ForecastList!
    var forecasts: [Forecast]!
    
    let locationManager = CLLocationManager()
    var currentLocationCoord: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        currentWeatherDet = CurrentWeather()
        forecastList = ForecastList()

        locationAuthStatus()
        
        currentWeatherDet.downloadWeatherDetails {
            self.updateMainUI()
            self.forecastList.downloadForecastData {
                let tempForecasts = self.forecastList._forecasts
                self.forecasts = [Forecast]()
                var i = 0
                for forecast in tempForecasts {
                    if i%4 == 1 {
                        self.forecasts.append(forecast)
                    }
                    i += 1
                }
                
                
//                self.forecasts.remove(at: 0)
                self.weatherTableView.reloadData()
            }
            
        }
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocationCoord = locationManager.location
            Location.sharedInstance.latitude = currentLocationCoord.coordinate.latitude
            Location.sharedInstance.longitude = currentLocationCoord.coordinate.longitude
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        locationAuthStatus()
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let forecastList = forecasts as? [Forecast] {
            return forecastList.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            if let forecastList = forecasts as? [Forecast] {
                let forecast = forecastList[indexPath.row]
                cell.configureCell(forecast: forecast)
                return cell
            }
            return WeatherCell()
        }
        return WeatherCell()
    }
    
    func updateMainUI(){
        dateLbl.text = currentWeatherDet.date
        currentTempLbl.text = "\(currentWeatherDet.currentTemp)"
        currentLocation.text = currentWeatherDet.cityName
        currentWeather.text = currentWeatherDet.weatherType
        currentWeatherImg.image = UIImage(named: currentWeatherDet.weatherType)
    }
    
    
}

