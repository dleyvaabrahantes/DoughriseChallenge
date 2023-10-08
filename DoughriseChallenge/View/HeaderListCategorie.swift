//
//  HeaderListCategorie.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct HeaderListCategorie: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Categorie.name, ascending: true)], animation: .default)
    private var lists: FetchedResults<Categorie>
    
    var body: some View {
        VStack(alignment: .center){
            HStack {
                Text("April 2022")
                    .font(.system(size: 13))
                    .foregroundColor(Color("Green"))
                    Image("Polygon")
            }
            .padding(5)
            
            .background {
                Color("Green").opacity(0.2)
        }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack{
                HStack(spacing: 20){
                    VStack{
                        Text("Spend")
                            .font(.system(size: 16))
                            .foregroundColor(Color("Gray"))
                        Text("$\(lists.reduce(0){$0 + $1.spent})")
                            .font(.system(size: 21))
                    }
                    
                    Divider()
                        .frame(width: 1,height: 30)
                        .overlay(Color("Gray"))
                    
                    VStack{
                        Text("Available")
                            .font(.system(size: 16))
                            .foregroundColor(Color("Gray"))
                        Text("$\(calculateAvailable())")
                            .font(.system(size: 21))
                            .foregroundColor(Color("Green"))
                    }
                    
                   // .padding()
                    Divider()
                        .frame(width: 1,height: 30)
                        .overlay(Color("Gray"))
                    VStack{
                        Text("Budget")
                            .font(.system(size: 16))
                            .foregroundColor(Color("Gray"))
                        Text("$\(lists.reduce(0) { $0 + $1.total })")
                            .font(.system(size: 21))
                    }
                   
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
    
    func calculateAvailable() -> Int{
        var budget = lists.reduce(0) { $0 + $1.total }
        var spend = lists.reduce(0) { $0 + $1.spent }
        
        return Int(budget - spend)
    }
}

struct HeaderListCategorie_Previews: PreviewProvider {
    static var previews: some View {
        HeaderListCategorie()
    }
}
