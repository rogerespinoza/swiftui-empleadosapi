//
//  EmpleadosAPIApp.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 10/4/23.
//

import SwiftUI

@main
struct EmpleadosAPIApp: App {
    @StateObject var vm = EmpleadoVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .task(priority: .high) {
                    await vm.getData()
                }
        }
    }
}
