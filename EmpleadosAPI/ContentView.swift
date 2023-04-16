//
//  ContentView.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm:EmpleadoVM
    
    var body: some View {
        NavigationStack {
            List(vm.empleados) { empleado in
                HStack {
                    VStack(alignment: .leading) {
                        Text(empleado.lastName)
                            .font(.headline)
                        Text(empleado.email)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    AsyncImage(url: empleado.avatar) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .background {
                                Color(white: 0.9)
                            }
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }

                }
            }
            .navigationTitle("Empleados")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    RefreshButton()
                }
            }
            .refreshable {
                await vm.getData()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var vm = EmpleadoVM.test
    static var previews: some View {
        ContentView()
            .environmentObject(vm)
            .task(priority: .high) {
                await vm.getData()
            }
    }
}
