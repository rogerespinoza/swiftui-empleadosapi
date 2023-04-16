//
//  PersistenceTests.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import SwiftUI

extension URL {
    static let empleados = Bundle.main.url(forResource: "empleadosTest", withExtension: "json")!
    static let departamentos = Bundle.main.url(forResource: "departamentos", withExtension: "json")!
    static let generos = Bundle.main.url(forResource: "generos", withExtension: "json")!
}

final class PersistenceTests:NetworkPersistence {
    func getDepartamentos() async throws -> [MaestroDepartamento] {
        let data = try Data(contentsOf: .departamentos)
        return try JSONDecoder().decode([MaestroDepartamento].self, from: data)
    }
    
    func getEmpleados() async throws -> [Empleado] {
        let data = try Data(contentsOf: .empleados)
        return try JSONDecoder().decode([Empleado].self, from: data)
    }
    
    func getGeneros() async throws -> [MaestroGenero] {
        let data = try Data(contentsOf: .generos)
        return try JSONDecoder().decode([MaestroGenero].self, from: data)
    }
}

extension EmpleadoVM {
    static let test = EmpleadoVM(persistence: PersistenceTests())
}

