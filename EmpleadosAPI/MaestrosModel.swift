//
//  MaestrosModel.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import Foundation

// MARK: - MaestroDepartamento
struct MaestroDepartamento: Codable {
    let name: String
    let id: Int
}

// MARK: - MaestroGenero
struct MaestroGenero: Codable {
    let id: Int
    let gender: String
}
