//
//  ProgressBarTotal.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct ProgressBarTotal: View {
    var array: [CategorieValueTotal]
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                HStack(spacing: 0) {
                    ForEach(array, id: \.id){ index in
                        Rectangle()
                            .frame(width: min(CGFloat(index.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                            .foregroundColor(Color(index.color))
                            .animation(.linear)
                    }
                }
                
            }
          //  .cornerRadius(10.0)
        }
    }
}

struct ProgressBarTotal_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarTotal(array: [CategorieValueTotal(id: UUID().uuidString, value: 0.3, color: "Blue"),
                                 CategorieValueTotal(id: UUID().uuidString, value: 0.2, color: "Yellow"),
                                 CategorieValueTotal(id: UUID().uuidString, value: 0.1, color: "Red"),])
        .cornerRadius(8)
        .frame(height: 32)
        .padding(.horizontal)
    }
}
