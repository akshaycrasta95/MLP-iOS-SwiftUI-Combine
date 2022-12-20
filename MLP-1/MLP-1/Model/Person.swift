//
//  Person.swift
//  MLP-1
//
//  Created by Akshay.Crasta on 19/12/22.
//

import Foundation

struct Person: Codable, Identifiable {
    var id: UUID { UUID() }
    
    var name: String?
    var language: String?
}

struct PeopleData: Codable {
    var people: [Person]
}
