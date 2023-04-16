//
//  EmpleadoModel.swift
//  EmpleadosAPI
//
//  Created by Roger Espinoza on 12/4/23.
//

import Foundation

// MARK: - Empleado
struct Empleado: Codable, Identifiable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String
    let avatar: URL
    let department: Department
    let gender: Gender
    
//    var fullName:String {
//        "\(lastName), \(firstName)"
//    }
}

// MARK: - Department
struct Department: Codable, Identifiable, Hashable {
    let id:Int
    let name:DepartmentName
}

enum DepartmentName: String, Codable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
}

// MARK: - GenderClass
struct Gender: Codable, Identifiable, Hashable {
    let gender: GenderName
    let id: Int
}

enum GenderName: String, Codable {
    case female = "Female"
    case male = "Male"
}


