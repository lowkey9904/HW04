//
//  MovieData.swift
//  crudmovie
//
//  Created by User18 on 2019/12/2.
//  Copyright © 2019 ntou. All rights reserved.
//

import Foundation

class MovieData: ObservableObject {
    @Published var movies = [Movie](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(movies) {
                UserDefaults.standard.set(data, forKey: "movies")
            }
        }
    }
        
        init() {
            if let data = UserDefaults.standard.data(forKey: "movies") {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([Movie].self,from: data) {
                    movies = decodedData
                }
            }
         }
}
