//
//  EmpleadoCVM.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import SwiftUI
import Combine

final class EmpleadoCVM:ObservableObject {
    let persistence = PersistenceCombine.shared

    @Published var empleados:[Empleado] = []
    @Published var departamentos:[MaestroDepartamento] = []
    @Published var generos:[MaestroGenero] = []
    
    var subscribers = Set<AnyCancellable>()
    
    init() {
        getEmpleadosSink()
    }
    
    func getEmpleadosClean() {
        persistence.getEmpleados { error in
            print(error)
        } value: { empleados in
            self.empleados = empleados
        }
        .store(in: &subscribers)
    }
    
    func getEmpleadosSink() {
        persistence.getEmpleados()
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { empleados in
                self.empleados = empleados
            }
            .store(in: &subscribers)
    }
    
    func getDataSink() {
        Publishers.Zip3(persistence.getEmpleados(), persistence.getGeneros(), persistence.getDepartamentos())
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { empleados, generos, departamentos in
                self.empleados = empleados
                self.generos = generos
                self.departamentos = departamentos
            }
            .store(in: &subscribers)
    }
}

