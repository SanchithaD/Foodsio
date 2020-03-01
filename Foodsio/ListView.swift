//
//  ListView.swift
//  Foodsio
//
//  Created by Sanchitha on 2/29/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI
import Combine
import CoreML

struct RecommenderListView: View {
    @ObservedObject var topRecommendations = Recommender()
    
    var body: some View {
        NavigationView {
            VStack{
                AppTitleView(Title: "Grocery Reminders")
            List(topRecommendations.Grocerys) { Grocery in
                VStack (alignment: .leading) {
                    Text(Grocery.name)
                    
                }
            }
        }
        }
    }
}

struct RecommenderListViewPreviews: PreviewProvider {
    static var previews: some View {
        RecommenderListView()
    }
}



public class Recommender: ObservableObject {
    
    @Published var Grocerys = [Grocery]()
    
    init(){
        load()
    }
    
    func load() {
        do{
            let recommender = GroceryRecommender()
            
            let ratings : [String: Double] = ["Home Alone": 3.0, "Titanic": 3.5]
            let input = GroceryRecommenderInput(items: ratings, k: 5, restrict_: [], exclude: [])
            
            let result = try recommender.prediction(input: input)
            var tempGrocerys = [Grocery]()
            
            for str in result.recommendations{
                let score = result.scores[str] ?? 0
                tempGrocerys.append(Grocery(name: "\(str)", score: score))
            }
            self.Grocerys = tempGrocerys
            
        }catch(let error){
            print("error is \(error.localizedDescription)")
        }
        
    }
}

struct Grocery: Identifiable {
    public var id = UUID()
    public var name: String
    public var score: Double
    
}
