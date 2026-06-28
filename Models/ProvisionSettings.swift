//
//  ProvisionSettings.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//

import Foundation

struct ProvisionSettings: Codable {
    var ssid: String = ""
    var password: String = ""
    var serverHost: String = ""
    var serverPort: Int = 3000
    var nodeName: String = ""
}
