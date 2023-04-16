//
//  EmpleadoVM.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import SwiftUI

final class EmpleadoVM:ObservableObject {
    let persistence:NetworkPersistence
    
    @Published var empleados:[Empleado] = []
    @Published var departamentos:[MaestroDepartamento] = []
    @Published var generos:[MaestroGenero] = []
    
    init(persistence:NetworkPersistence = Persistance.shared){
        self.persistence = persistence
    }
    
    func getData() async {
        do {
//            async let empleados = try persistence.getEmpleados()
//            async let departamentos = try persistence.getDepartamentos()
//            async let generos = try persistence.getGeneros()
            let (empleados, departamentos, generos) = try await (persistence.getEmpleados(), persistence.getDepartamentos(), persistence.getGeneros())

            await MainActor.run {
                (self.empleados, self.departamentos, self.generos) = (empleados, departamentos, generos)
            }
        } catch {
            print(error)
        }
    }
    
    @MainActor func getDataMain() async {
        do {
            async let empleados = try persistence.getEmpleados()
            async let departamentos = try persistence.getDepartamentos()
            async let generos = try persistence.getGeneros()
            (self.empleados, self.departamentos, self.generos) = try await (empleados, departamentos, generos)
        } catch {
            print(error)
        }
    }
}
