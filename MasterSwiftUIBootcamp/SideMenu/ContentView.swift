//
//  SideMenueView.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    var body: some View {
        NavigationStack {
            ZStack {
//                VStack {
//                    Image(systemName: "globe")
//                        .imageScale(.large)
//                        .foregroundStyle(.tint)
//                    Text("Hello World!")
//                }
                
                TabView(selection: $selectedTab) {
                   Text("Dashboard")
                        .tag(0)
                    Text("Performance")
                         .tag(1)
                    Text("Profile")
                         .tag(2)
                    Text("Search")
                         .tag(3)
                    Text("Notifications")
                         .tag(4)
                }
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
        .padding()
        }
    }
}

#Preview {
    ContentView()
}
