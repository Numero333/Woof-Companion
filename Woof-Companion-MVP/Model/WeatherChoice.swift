//
//  WeatherChoice.swift
//  MVVM-companion-v1
//
//  Created by François-Xavier on 07/09/2023.
//

import Foundation

enum WeatherChoice: String, CaseIterable {
    case rain, sun, cloud, storm, wind, snow
    
    var description: String {
            switch self {
            case .rain: return "Pluie"
            case .sun: return "Soleil"
            case .cloud: return "Nuage"
            case .storm: return "Orage"
            case .wind: return "Vent"
            case .snow: return "Neige"
            }
        }
}
