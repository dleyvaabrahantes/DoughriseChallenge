//
//  AddExpense.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct AddExpense: View {
    @State private var selectedCategory: String = "Categories"
    @State private var spendingAmount: String = ""
    
    let categories = ["Categories","Food","Shopping", "Transportation"]
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Categorie.name, ascending: true)], animation: .default)
    private var lists: FetchedResults<Categorie>
    
    var body: some View {
        VStack {
            List{
                let categoriesWithText = ["Categories"] + lists.map { $0.name ?? "" }
                Picker("Select a category", selection: $selectedCategory) {
                    ForEach(categoriesWithText, id: \.self) { index in
                        Text(index)
                    }
                }
                .padding()
                
                if selectedCategory != "Categories" {
                    TextField("Enter spending amount", text: $spendingAmount)
                        .keyboardType(.numberPad)
                        .padding()
                    
                    Button(action: {
                          saveSpendingAmount()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                    }
                    .padding()
                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                }
                .padding()
            }
        }
        .navigationTitle("Expense Tracker")
    }
    
    private func saveSpendingAmount() {
        let categorie = lists.filter({$0.name == selectedCategory}).first
        
        var spentTotal = Int(categorie?.spent ?? 0 ) + (Int(spendingAmount) ?? 0)
        
        CoreDataManager.shared.updateSpent(name: selectedCategory, value: spentTotal)
        
        
        // Update the category's spent amount
        // You can replace this with your actual logic to update the categories
     //   print("Category: \(category.name), Spending Amount: \(spendingAmount)")
    }
}


struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense()
    }
}
