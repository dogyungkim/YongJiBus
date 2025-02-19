//
//  ContentView.swift
//  YongJiBus
//
//  Created by 김도경 on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : TopBarType = .MyongJi
    @StateObject var viewModel = AppViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                HeaderView(topBarType: $currentTab)
                TabView(selection: $currentTab){
                    ShuttleView()
                        .tabItem {
                            Image(systemName: "m.circle.fill")
                            Text("명지대역")
                        }
                        .toolbarBackground(.white, for: .tabBar)
                        .tag(TopBarType.MyongJi)
                    StationView()
                        .tabItem{
                            Image(systemName: "g.circle.fill")
                            Text("기흥역")
                        }
                        .toolbarBackground(.white, for: .tabBar)
                        .tag(TopBarType.Giheung)
                    ChattingListView()
                        .tabItem{
                            Image(systemName: "c.circle.fill")
                            Text("택시 카풀")
                        }
                        .toolbarBackground(.white, for: .tabBar)
                        .tag(TopBarType.Taxi)
                    SettingView()
                        .tabItem {
                            Image(systemName: "s.circle.fill")
                            Text("설정")
                        }
                        .tag(TopBarType.Setting)
                }
                .environmentObject(viewModel)
                .ignoresSafeArea()
                .onAppear{
                    if viewModel.isHolidayAuto {
                        viewModel.fetchDayType()
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    if viewModel.isHolidayAuto {
                        viewModel.fetchDayType()
                    }
                }
            }
            .background(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
