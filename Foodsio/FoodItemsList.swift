//
//  FoodItemsList.swift
//  Foodsio
//
//  Created by mihika on 2/29/20.
//  Copyright © 2020 mihika. All rights reserved.
//


import SwiftUI

struct FoodItemsList: View {
 @State private var showDetails = false
        @State private var showDetailtwo = false
        @State private var showDetailthree = false
        @State private var showDetailfour = false
        @State private var showDetailfive = false
        @State private var showDetailsix = false
        @State private var showDetailseven = false
        @State private var showDetaileight = false
        
        var body: some View {
                    VStack {
                       AppTitleView(Title: "Current Items List")

                       
                    
                    List {
                        Button(action: {
                            self.showDetails.toggle()
                            }) {
                                Text("Milk")
                                    .font(.title)
                                    .fontWeight(.light)
                                    .frame(width: 150.0, height: 60.0)
                                    .background(Color.red.opacity(0.4))
                                .cornerRadius(40)
                                    .padding(.top)
                                    .padding(.top)
                                    .padding(.top)
                            }

                            if showDetails {
                                Text("1 week until expiration")
                                    .font(.headline)
                            }
                            
                        
                        Button(action: {
                            self.showDetailtwo.toggle()
                        }) {
                            Text("Bread")
                                .font(.title)
                                .fontWeight(.light)
                                .frame(width: 150.0, height: 60.0)
                                .background(Color.red.opacity(0.4))
                            .cornerRadius(40)
                        }

                        if showDetailtwo{
                            Text("4 days until expiration")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.showDetailthree.toggle()
                        }) {
                            Text("Cereal")
                                 .font(.title)
                                 .fontWeight(.light)
                                .frame(width: 150.0, height: 60.0)
                            .background(Color.red.opacity(0.4))
                            .cornerRadius(CGFloat(30))
                            
                        }

                        if showDetailthree{
                            Text("1 week until expiration")
                                .font(.headline)
                            
                        }
                        
                        Button(action: {
                            self.showDetailfour.toggle()
                        }) {
                            Text("Pasta")
                                .font(.title)
                                .fontWeight(.light)
                            .frame(width: 150.0, height: 60.0)
                                .background(Color.red.opacity(0.4))
                            .cornerRadius(40)
                        }

                        if showDetailfour{
                            Text("2 days until expiration")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.showDetailfive.toggle()
                        }) {
                            Text("Bagel")
                                .font(.title)
                                .fontWeight(.light)
                            .frame(width: 150.0, height: 60.0)
                                .background(Color.red.opacity(0.4))
                            .cornerRadius(40)
                        }

                        if showDetailfive{
                            Text("2 days until expiration")
                                .font(.headline)
                        }
                        
                       
                }
                        Image("logo")
                        .resizable()
                            .frame(width: 170, height: 170)

                    }.background(Color.white)
            }

            }

    struct AnotherView: View {
        var body: some View {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                Text("All Food Scanner Code goes here")
                    .font(.largeTitle)
            }
        }
}

struct FoodItemsList_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemsList()
    }
}
