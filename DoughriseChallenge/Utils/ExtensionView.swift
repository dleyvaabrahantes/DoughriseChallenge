//
//  ExtensionView.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import Foundation
import SwiftUI

extension View {
    func hLeading()-> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing()-> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter()-> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    func getSafeArea()-> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
