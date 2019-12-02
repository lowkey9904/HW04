//
//  MovieList.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var movieData = MovieData()
    @State private var showEditmovie = false
    var body: some View {
        VStack{
        NavigationView {
            
            List {
                ForEach(movieData.movies) { (movie) in
                    NavigationLink(destination: MovieEditor(
                        editMovie:movie, movieData:self.movieData)) {
                        MovieRow(movie: movie)}
                }
                .onDelete { (indexSet) in
                self.movieData.movies.remove(atOffsets: indexSet)}
                .onMove { (indexSet, index) in
                    self.movieData.movies.move(fromOffsets: indexSet, toOffset: index)
                }
            }
          .navigationBarTitle("電影關注列表")
          
          .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            self.showEditmovie = true
          }, label: {
                Image(systemName: "plus.circle.fill")
          }))
          .sheet(isPresented: $showEditmovie) {
              NavigationView {
                MovieEditor(movieData: self.movieData)}
          }
          }.foregroundColor(Color(red:242/255, green: 107/255, blue: 145/255))
        }
        .colorMultiply(Color(red:255/255, green: 231/255, blue: 230/255))
        
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
