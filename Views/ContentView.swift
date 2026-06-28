//
//  ContentView.swift
//  RuViewFlasher
//
//  Created by user on 6/28/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var vm = MainViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Text("RuView Flasher")
                .font(.largeTitle)
                .bold()

            Divider()

            GroupBox("Device") {

                if let device = vm.connectedDevice {
                    Text(device.displayName)
                } else {
                    Text("No ESP32 Connected")
                        .foregroundStyle(.secondary)
                }

            }

            GroupBox("Firmware") {

                if let firmware = vm.selectedFirmware {
                    Text(firmware.filename)
                } else {
                    Text("No firmware selected")
                        .foregroundStyle(.secondary)
                }

                Button("Choose Firmware") {
                    // We'll implement this next.
                }

            }

            GroupBox("Wi-Fi") {

                TextField("SSID", text: $vm.settings.ssid)

                SecureField("Password",
                            text: $vm.settings.password)

            }

            ProgressView(value: vm.progress)

            Text(vm.status)

            Button("Flash & Provision") {
                vm.beginFlash()
            }
            .disabled(!vm.canFlash)

        }
        .padding()
        .frame(width: 520)
    }
}
