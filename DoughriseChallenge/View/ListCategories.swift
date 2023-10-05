//
//  ListCategories.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct ListCategories: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Categorie.name, ascending: true)], animation: .default)
     var lists: FetchedResults<Categorie>
    
    var body: some View {
        VStack{
            HeaderListCategorie()
                .padding(.top)
            ProgressBarTotal(array: calculateTotalsAndPercentages(categories: lists))
                .cornerRadius(8)
                .frame(height: 32)
                .padding(.horizontal)
            ScrollView{
                ForEach(lists, id: \.id) { category in
                    CategorieView(categorie: category)
                }
            }
            .id(UUID())
            .padding(.vertical,5)
            Spacer()
        }
    }
    
    func calculateTotalsAndPercentages(categories: FetchedResults<Categorie>) -> [CategorieValueTotal] {
        // Calcular la suma de los totales
        var categoriesNew: [CategorieValueTotal] = []
        let totalBudget = categories.reduce(0) { $0 + $1.total }
        print("Total Budget: \(totalBudget)")
        
        // Calcular el porcentaje que representa cada categoría
        for category in categories {
            let percentage = Float(category.spent) / Float(totalBudget)
            print("\(category.name) representa el \(percentage)% del total.")
            categoriesNew.append(CategorieValueTotal(id: UUID().uuidString, value: percentage, color: category.color ?? "Blue"))
        }
        return categoriesNew
    }
}

struct ListCategories_Previews: PreviewProvider {
    static var previews: some View {
        ListCategories()
    }
}
