//
//  Header.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack{
            Color("HeaderColor")
            HStack{
                Text("Monthly Budget")
                    .font(.title3)
                    .foregroundColor(.white)
                Button {
                    print("Change month")
                } label: {
                    Image("down")
                }
                Spacer()
                
                Button {
                    print("Change month")
                } label: {
                    Image("share")
                }
                Button {
                    print("Change month")
                } label: {
                    Image("fav")
                }
                
            }
            .offset(y:20)
            .padding(.horizontal,25)
        }
        .cornerRadius(16)
        .frame(height: 160)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
