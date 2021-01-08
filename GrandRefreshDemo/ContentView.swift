//
//  ContentView.swift
//  GrandRefreshDemo
//
//  Created by shadowedge on 2021/1/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink("默认效果", destination: DefaultScrollDemo())
                NavigationLink("微信", destination: WechatRefreshDemo())
                NavigationLink("淘宝", destination: TaoBaoRefreshDemo())
            }.navigationBarTitle(Text("下拉刷新Demo"),displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
