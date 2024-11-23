//
//  GoalType.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import Foundation

struct GoalType : Identifiable, Decodable {
    let id: Int
    let icone: String
    let titulo: String
    let descricao: String
}
