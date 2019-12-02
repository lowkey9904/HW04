//
//  AppView.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            MovieList()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("電影列")
                }
            ChartView(movieData:MovieData())
                .tabItem {
                      Image(systemName: "questionmark")
                      Text("分析")
                }
        }.accentColor(Color(red:242/255, green: 107/255, blue: 145/255))
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
