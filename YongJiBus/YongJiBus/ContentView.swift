//
//  ContentView.swift
//  YongJiBus
//
//  Created by 김도경 on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTab : Int = 0
    
    var body: some View {
        TabView{
            ShuttleView()
                .tabItem {
                    Image(systemName: "m.circle.fill")
                    Text("명지대역")
                }
                .toolbarBackground(.white, for: .tabBar)
                .tag(0)
            StationView()
                .tabItem{
                    Image(systemName: "g.circle.fill")
                    Text("기흥역")
                }
                .toolbarBackground(.white, for: .tabBar)
                .tag(1)
            SettingView()
                .tabItem {
                    Image(systemName: "s.circle.fill")
                    Text("설정")
                }
                .tag(2)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
