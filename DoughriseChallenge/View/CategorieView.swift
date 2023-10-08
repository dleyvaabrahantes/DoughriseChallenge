//
//  CategorieView.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct CategorieView: View {
    @State var categorie: Categorie
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Image(categorie.name ?? "Food")
                   // .resizable()
                    .frame(width: 18, height: 18)
                    .padding()
                    .background {
                        Color(categorie.color ?? "Blue")
                    }
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 10){
                    Text(categorie.name ?? "Food")
                        .font(.system(size: 16))
                        .bold()
                    HStack(spacing: 5){
                        Text("spent")
                            .foregroundColor(Color("Gray"))
                            .font(.system(size: 15))
                       Text("$\(categorie.spent)")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(Color("Green"))
                        Text("of $\(categorie.total)")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Gray"))
                    }
                    
                }
                .padding(.leading,5)
                Spacer()
                VStack{
                    
                    Text("$\(categorie.left)")
                        .font(.system(size: 21))
                        .bold()
                        .foregroundColor(Color("Green"))
                    Text("left")
                        .font(.system(size: 13))
                    
                }
                .padding(.top,8)
        }
            .padding(.horizontal)
          
            ProgressBar(value: categorie.progress, color: categorie.color ?? "Blue")
                .frame(height: 5)
            
        }
    //    .padding(.top)
    }
}

struct CategorieView_Previews: PreviewProvider {
    static var previews: some View {
        CategorieView(categorie: Categorie(context: CoreDataManager.shared.context))
    }
}
