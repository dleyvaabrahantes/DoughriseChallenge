//
//  ButtonFloating.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import Foundation
import SwiftUI

struct ButtonFloat:View {
    @Binding var show: Bool
    @Binding var showSheet: Bool
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button {
                    self.show.toggle()
                    self.showSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 15)
                        .padding(22)
                    
                }
                .background(Color("HeaderColor"))
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotationEffect(.init(degrees: show ? 180 : 0))

            }
            .animation(.spring())
        }
        .padding(.bottom,getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom + 5))
    }
}

struct ButtonFloat_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
