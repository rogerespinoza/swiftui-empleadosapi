//
//  PersistenceCombine.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import SwiftUI
import Combine

final class PersistenceCombine {
    static let shared = PersistenceCombine()
    
    func getEmpleados() -> AnyPublisher<[Empleado], Error> {
        URLSession.shared
            .dataTaskPublisher(for: .get(url: .getEmpleados))
            .map(\.data)
            .decode(type: [Empleado].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func getEmpleados(errorValue: @escaping (Error) -> Void, value: @escaping ([Empleado]) -> Void) -> AnyCancellable {
        URLSession.shared
            .dataTaskPublisher(for: .get(url: .getEmpleados))
            .map(\.data)
            .decode(type: [Empleado].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    errorValue(error)
                }
            } receiveValue: { empleados in
                value(empleados)
            }
    }
    
    func getGeneros() -> AnyPublisher<[MaestroGenero], Error> {
        URLSession.shared
            .dataTaskPublisher(for: .get(url: .getGeneros))
            .map(\.data)
            .decode(type: [MaestroGenero].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getDepartamentos() -> AnyPublisher<[MaestroDepartamento], Error> {
        URLSession.shared
            .dataTaskPublisher(for: .get(url: .getDepartamentos))
            .map(\.data)
            .decode(type: [MaestroDepartamento].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
