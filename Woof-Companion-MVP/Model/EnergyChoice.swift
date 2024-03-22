//
//  EnergyChoice.swift
//  MVVM-companion-v1
//
//  Created by François-Xavier on 07/09/2023.
//

import Foundation

enum EnergyChoice: String, CaseIterable {
    
case highEnergy, mediumEnergy, lowEnergy
    var description: String {
        switch self {
        case .highEnergy: return "Elevée"
        case .mediumEnergy: return "Normal"
        case .lowEnergy: return "Bas"
        }
    }
}
