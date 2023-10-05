//
//  ContentView.swift
//  DoughriseChallenge
//
//  Created by David on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = "Home"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { _ in
                ZStack{
                    Home()
                        .opacity(selectedTab == "Home" ? 1 : 0)
                    Text("Trends")
                        .opacity(selectedTab == "Trends" ? 1 : 0)
                    Text("Transactions")
                        .opacity(selectedTab == "Transactions" ? 1 : 0)
                    Text("Community")
                        .opacity(selectedTab == "Community" ? 1 : 0)
                    Text("Profile")
                        .opacity(selectedTab == "Profile" ? 1 : 0)
                }
            }
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                    if tab != tabs.last{
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal,30)
            .padding(.bottom, edges?.bottom == 0 ? 15 : edges?.bottom)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var animation : Namespace.ID
    
    var body: some View {
        Button {
            withAnimation {
                selectedTab = title
            }
        } label: {
            VStack(spacing: 6){
                
                ZStack{
                    CustomShape()
                        .fill(.clear)
                        .frame(width: 45, height: 6)
                    
                    if selectedTab == title {
                        CustomShape()
                            .fill(Color("HeaderColor").opacity(selectedTab == title ? 1 : 0))
                            .frame(width: 45, height: 6)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
                    .padding(.bottom,10)
                
                Image(title)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(selectedTab == title ? Color("HeaderColor") : .black.opacity(0.2))
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
            }
        }

    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

var tabs = ["Home", "Trends", "Transactions", "Community", "Profile"]
