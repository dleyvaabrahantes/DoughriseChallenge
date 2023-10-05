//
//  AddCategoryForm.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct AddCategoryForm: View {
        @Environment(\.managedObjectContext) private var viewContext
        @Environment(\.presentationMode) var presentationMode
        @State private var categoryName: String = ""
        @State private var totalAmount: String = ""
        @State private var spentAmount: String = ""
        @State private var selectedColor: String = ""

        let colorOptions = ["Red", "Blue", "Yellow"]

        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Category Details")) {
                        TextField("Category Name", text: $categoryName)
                        TextField("Total Amount", text: $totalAmount)
                            .keyboardType(.numberPad)
                        TextField("Spent Amount", text: $spentAmount)
                            .keyboardType(.numberPad)
                    }

                    Section(header: Text("Category Color")) {
                        Picker("Select Color", selection: $selectedColor) {
                            ForEach(colorOptions, id: \.self) { color in
                                Text(color).tag(color)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    Section {
                        Button(action: {
                            saveCategory()
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Add Category")
                        }
                    }
                }
                .navigationTitle("Add Category")
            }
        }

        private func saveCategory() {
            let category = Categorie(context: viewContext)
            category.id = UUID().uuidString
            category.name = categoryName
            category.color = selectedColor
            category.total = Int16(totalAmount) ?? 2000
            category.spent = Int16(spentAmount) ?? 0
            CoreDataManager.shared.saveContext()

//            let newCategory = Category(name: categoryName,
//                                       total: total,
//                                       spent: spent,
//                                       color: selectedColor)

            // TODO: Save the category or perform any other desired action with the new category
          //  print("Category added: \(newCategory)")
        }
}

struct AddCategoryForm_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryForm()
    }
}
