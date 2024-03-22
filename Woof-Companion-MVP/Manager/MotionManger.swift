//
//  MotionManger.swift
//  Woof-Companion-MVP
//
//  Created by François-Xavier on 22/03/2024.
//

import Foundation
import CoreMotion

#warning("Gestion des erreurs")

final class PedometerManager: ObservableObject {
    
    // MARK: Property
    private let pedometer: CMPedometer
    @Published private var stepCount: NSNumber
    @Published var currentDistance: NSNumber
    @Published var elapsedDistanceFormatted: String
    @Published var speed: String
    
    // MARK: - Initialization
    init(){
        pedometer = CMPedometer()
        stepCount = 0
        currentDistance = 0
        elapsedDistanceFormatted = "00.00"
        speed = "0"
    }
    
    // MARK: Accessible
    func startCountingSteps() {
        if CMPedometer.isStepCountingAvailable() {
            
            pedometer.startUpdates(from: Date()) { [weak self] (data, error) in
                guard let self = self, let data = data, error == nil else {
                    print("Error starting pedometer: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                                
                self.stepCount = data.numberOfSteps
                guard let dataDistance = data.distance else { return }
                guard let dataPace = data.averageActivePace else { return }
                self.currentDistance = dataDistance
                self.elapsedDistanceFormatted = self.formatDistance(distance: dataDistance)
                self.speed = String(describing: dataPace)
            }
        } else {
            print("Pedometer is not available on this device.")
        }
    }
    
    func formatDistance(distance: NSNumber) -> String {
        let kilometers = Int(truncating: distance) / 1000
        let meters = Int(truncating: distance) % 1000
        let formatDistance = String(format: "%02d.%02d", kilometers, meters)
        return formatDistance
    }
}
