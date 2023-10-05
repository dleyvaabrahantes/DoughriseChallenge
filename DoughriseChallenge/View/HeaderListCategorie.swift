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
                    .font(.callout)
                    .foregroundColor(.green)
                    Image("Polygon")
            }
            .padding(5)
            
            .background {
                Color.green.opacity(0.2)
        }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack{
                HStack(spacing: 10){
                    VStack{
                        Text("Spend")
                        Text("$\(lists.reduce(0){$0 + $1.spent})")
                            .font(.title)
                    }
                    
                    Divider()
                        .frame(width: 1,height: 20)
                        .overlay(.black)
                    
                    VStack{
                        Text("Available")
                        Text("$\(calculateAvailable())")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                    
                   // .padding()
                    Divider()
                        .frame(width: 1,height: 20)
                        .overlay(.black)
                    VStack{
                        Text("Budget")
                        Text("$\(lists.reduce(0) { $0 + $1.total })")
                            .font(.title)
                    }
                   
                }
                .padding(.horizontal)
            }
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
