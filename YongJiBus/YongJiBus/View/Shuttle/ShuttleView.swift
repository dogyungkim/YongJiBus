//
//  ShuttleView.swift
//  YongJiBus
//
//  Created by 김도경 on 2023/07/06.
//195,168,246

import SwiftUI

struct ShuttleView: View {
    var body: some View {
        VStack{
            HeaderView("명지대역")
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    BusBoxView(.one)
                    BusBoxView(.three)
                    BusBoxView(.zero)
                } // HStack
            }
            .padding(.horizontal, 20)
            ShuttleTimeView()
        }//VStack
        .background(.white)
    }//body
}

struct MyongJiView_Previews: PreviewProvider {
    static var previews: some View {
        ShuttleView()
    }
}
