//
//  ContentView.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var serialManager = SerialPortManager()

    var body: some View {
        VStack(spacing: 20) {

            Text("RuView Flasher")
                .font(.largeTitle)
                .bold()

            Divider()

            GroupBox("ESP32 Device") {
                VStack(alignment: .leading) {
                    if let port = serialManager.selectedPort {
                        Text("Connected:")
                        Text(port)
                            .font(.system(.body, design: .monospaced))
                    } else {
                        Text("No ESP32 detected")
                            .foregroundColor(.secondary)
                    }

                    Button("Refresh") {
                        serialManager.scan()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            GroupBox("Firmware") {
                Button("Select Firmware (.bin)") {
                    // Added next
                }
            }

            GroupBox("Wi-Fi Provisioning") {
                VStack {
                    TextField("SSID", text: .constant(""))
                    SecureField("Password", text: .constant(""))
                }
            }

            Button("Flash & Provision") {
                // Added next
            }
            .buttonStyle(.borderedProminent)

        }
        .padding(30)
        .frame(width: 500)
        .onAppear {
            serialManager.scan()
        }
    }
}
