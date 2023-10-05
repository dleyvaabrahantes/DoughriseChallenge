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
                Image(categorie.name ?? "")
                   // .resizable()
                    .frame(width: 18, height: 18)
                    .padding()
                    .background {
                        Color(categorie.color ?? "")
                    }
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 8){
                    Text(categorie.name ?? "")
                        .font(.title3)
                        .bold()
                    Text("spent")
                    + Text("$\(categorie.spent)")
                        .foregroundColor(.green)
                    + Text("of $ \(categorie.total)")
                }
              //  .padding(.top,8)
                Spacer()
                VStack{
                    Text("$\(categorie.left)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.green)
                    Text("left")
                    
                }
                
                
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
        ListCategories()
    }
}
