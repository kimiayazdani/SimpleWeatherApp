//
//  Constants.swift
//  RainyShine
//
//  Created by Kimia Yazdani on 6/28/23.
//

import Foundation


let BASE_URL="https://api.openweathermap.org/data/2.5/"
let LATITUDE="lat="
let LONGITUDE="&lon="
let APPID="&appid="
let API_KEY="79f95a1976aef58ad2ecff5d6c6c53b6"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL="\(BASE_URL)weather?\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APPID)\(API_KEY)"


let FORECAST_WEATHER_URL="\(BASE_URL)forecast?\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"

