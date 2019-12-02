//
//  MovieRow.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    var body: some View {
        HStack{
            Text(movie.name)
            Spacer()
            Text("\(movie.type)片")
            Text("\(movie.time)分鐘")
            Image(systemName: movie.trueHeart ? "heart.fill" :"heart")
        }
        .background(Color(red: 1,green: 205/255, blue:201/255))
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(name:"雙子殺手", type: "科幻動作", time: "117", trueHeart: true))
    }
}
