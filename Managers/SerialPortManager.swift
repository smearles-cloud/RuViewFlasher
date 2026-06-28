//
//  SerialPortManager.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//
import Foundation
import Combine
import IOKit.serial

@MainActor
class SerialPortManager: ObservableObject {

    @Published var ports: [String] = []
    @Published var selectedPort: String?

    func scan() {

        ports.removeAll()

        let devices = [
            "/dev/cu.usbmodem",
            "/dev/cu.SLAB_USBtoUART",
            "/dev/cu.wchusbserial"
        ]

        let fm = FileManager.default

        if let matches = try? fm.contentsOfDirectory(
            atPath: "/dev"
        ) {

            for device in matches {

                for prefix in devices {

                    if "/dev/" + device == prefix ||
                       device.hasPrefix(prefix.replacingOccurrences(of: "/dev/", with: "")) {

                        ports.append("/dev/" + device)
                    }
                }
            }
        }

        selectedPort = ports.first
    }
}
