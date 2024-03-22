//
//  TimerManager.swift
//  Woof-Companion-MVP
//
//  Created by François-Xavier on 22/03/2024.
//

import Foundation

final class TimerManager: ObservableObject {
    
    // MARK: Property
    @Published var displayElapsedTime = "00:00:00"
    let startHour = Date.now.formatted(date: .omitted, time: .shortened)
    var elapsedTime: Double = 0
    var totalInSecond: Double = 0
    private var startDate = Date()
    private var timer = Timer()
        
    // MARK: Accesible
    func start() {
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.elapsedTime = abs(self.startDate.timeIntervalSinceNow) + self.totalInSecond
            DispatchQueue.main.async {
                self.displayElapsedTime = self.formatTime(time: self.elapsedTime)
            }
        }
    }

    func pause() {
        totalInSecond += abs(startDate.timeIntervalSinceNow)
        timer.invalidate()
    }
    
    func stop() {
        totalInSecond += abs(startDate.timeIntervalSinceNow)
        timer.invalidate()
    }
    
    // MARK: Private
    private func formatTime(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let hours = minutes / 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    deinit {
        timer.invalidate()
    }
}
