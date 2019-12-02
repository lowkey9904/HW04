//
//  ChartView.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var movieData = MovieData()
    var body: some View {
        ZStack{
            Color(red:255/255, green: 231/255, blue: 230/255)
            .edgesIgnoringSafeArea(.all)

        VStack{
            PieChart(movieData: self.movieData).frame(width:300,height: 300)
            CircleChart(movieData: self.movieData).frame(width:300,height: 300)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
