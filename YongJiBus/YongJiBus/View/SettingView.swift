//
//  SettingView.swift
//  YongJiBus
//
//  Created by 김도경 on 2023/08/17.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack{
            Text("문의 : prunsoli11@gmail.com")
                .font(.caption2)
                .foregroundColor(.gray)
            Text("저작권 어쩌고 저쩌고")
                .font(.caption2)
                .foregroundColor(.gray)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
