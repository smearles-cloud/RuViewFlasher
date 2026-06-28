//
//  MainViewModel.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//
import Foundation
import Combine

@MainActor
final class MainViewModel: ObservableObject {

    // MARK: - Device

    @Published var connectedDevice: Device?

    // MARK: - Firmware

    @Published var selectedFirmware: Firmware?

    // MARK: - Provisioning

    @Published var settings = ProvisionSettings()

    // MARK: - Flash State

    @Published var isFlashing = false
    @Published var progress: Double = 0.0
    @Published var status = "Ready"

    var canFlash: Bool {
        connectedDevice != nil &&
        selectedFirmware != nil &&
        !isFlashing
    }

    func beginFlash() {
        isFlashing = true
        progress = 0
        status = "Preparing..."
    }

    func finishFlash() {
        isFlashing = false
        progress = 1.0
        status = "Complete"
    }

    func flashFailed(_ message: String) {
        isFlashing = false
        status = message
    }
}
