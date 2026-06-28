//
//  Firmware.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//
import Foundation

struct Firmware: Identifiable {
    let id = UUID()
    let url: URL

    var filename: String {
        url.lastPathComponent
    }
}
