//
//  Home.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var showSheet: Bool = false
    @State var show: Bool = false
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Categorie.name, ascending: true)], animation: .default)
    private var lists: FetchedResults<Categorie>
    @State var showAddExpense : Bool = false
    @State var showAddCategory : Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                Header()
                ListCategories()
                    .background(content: {
                        Color.white
                    })
                    .frame(height: 500)
                    .cornerRadius(20)
                    .padding(.horizontal,25)
                    .shadow(radius: 8)
                    .offset(y:-50)
                Spacer()
                
            }
            .background(Color.gray.opacity(0.02))
        .ignoresSafeArea()
            VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                ExpandableFAB(show: $show, showAddExpense: $showAddExpense, showAddCategory: $showAddCategory)
                                    .padding(.trailing, 20)
                            }.padding([.bottom], 30)
                        }
//            ButtonFloat(show: $show, showSheet: $showSheet)
                .sheet(isPresented: $showAddExpense) {
                    //AddCategoryForm()
                    AddExpense()
                }
                .sheet(isPresented: $showAddCategory) {
                    //AddCategoryForm()
                    AddCategoryForm()
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(showAddExpense: false, showAddCategory: false)
    }
}

struct ExpandableFAB : View {
    @Binding var show : Bool
    @Binding var showAddExpense : Bool
    @Binding var showAddCategory : Bool
    
    var body: some View{
        VStack(spacing: 20){
            
            if self.show {
                Button {
                    self.showAddExpense.toggle()
                    self.show.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(15)
                }
                .background(Color("HeaderColor"))
                .foregroundColor(Color.white)
                .clipShape(Circle())
                
                Button {
                    self.showAddCategory.toggle()
                    self.show.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(15)
                }
                .background(Color("HeaderColor"))
                .foregroundColor(Color.white)
                .clipShape(Circle())
            }
            
            Button {
                self.show.toggle()
            } label: {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 20, height: 18)
                    .padding(15)
            }
            .background(Color("HeaderColor"))
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .rotationEffect(.init(degrees: self.show ? 180 : 0))

        }.animation(.spring())
    }
}
