//
//  MovieEditor.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct MovieEditor: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var time = ""
    @State private var trueHeart = false
    @State private var showAlert = false
    var editMovie: Movie?
    var movieData: MovieData
    var body: some View {
        VStack{
            Form {
                TextField("名字", text: $name)
                profileType(selectedType: self.$type)
                TextField("片長(分鐘)", text: $time)
                .keyboardType(.numberPad)
                Toggle("是否推薦", isOn: $trueHeart)
            }
            .navigationBarTitle(editMovie == nil ? "增加新關注電影" : "編輯電影")
            .navigationBarItems(trailing: Button("儲存") {
            let movie = Movie(name: self.name, type: self.type, time: self.time, trueHeart: self.trueHeart)
            if let editMovie = self.editMovie {
                let index = self.movieData.movies.firstIndex {
                return $0.id == editMovie.id
            }!
            self.movieData.movies[index] = movie
            } else {
                self.movieData.movies.insert(movie, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
         })
            .onAppear {
                if let editMovie = self.editMovie{
                    self.name = editMovie.name
                    self.type = editMovie.type
                    self.time = editMovie.time
                    self.trueHeart = editMovie.trueHeart
                }
            }
        }
        .padding(.top)
        .foregroundColor(Color(red:242/255, green: 107/255, blue: 145/255))
        .colorMultiply(Color(red:255/255, green: 231/255, blue: 230/255))
    }
} 

struct MovieEditor_Previews: PreviewProvider {
    static var previews: some View {
        MovieEditor(movieData: MovieData())
    }
}

struct profileType: View
{
    @Binding var selectedType: String
    var types = ["動作", "科幻", "愛情", "恐怖", "文藝", "紀錄"]
    var body: some View
    {
        Picker(selection: $selectedType, label: Text("類型"))
        {
            ForEach(types, id: \.self)
            {
                (type) in
                Text(type)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
