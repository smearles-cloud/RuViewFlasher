//
//  Device.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//
import Foundation

struct Device: Identifiable {
    let id = UUID()

    let port: String
    let chip: String

    var displayName: String {
        "\(chip) (\(port))"
    }
}
