//
//  CategorieModel.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import Foundation

struct CategorieModel: Identifiable {
    let id: String
    let name: String
    let total: Int
    let spent: Int
    let color: String
    var left: Int {
        total - spent
    }
    
    var progress: Float {
        Float(spent) / Float(total)
    }
}

struct CategorieValueTotal {
    let id: String
    let value: Float
    let color: String
}

let arrayCategories = [CategorieModel(id: UUID().uuidString, name: "Food", total: 100, spent: 10, color: "Blue"),
             CategorieModel(id: UUID().uuidString, name: "Shopping", total: 100, spent: 20, color: "Red"),
             CategorieModel(id: UUID().uuidString, name: "Transportation", total: 100, spent: 20, color: "Yellow")]
