//
//  ContentView.swift
//  Foodsio
//
//  Created by Sanchitha on 2/29/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//
import SwiftUI
import UIKit
import Vision
import VisionKit

struct ContentView: View {
    private let buttonInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    
    var body: some View {
        VStack(spacing: 32) {
            AppTitleView(Title: "Expiration Scanner")
            Button(action: openCamera) {
                Text("Scan").foregroundColor(.white)
            }.padding(buttonInsets)
                .background(Color.blue)
                .cornerRadius(3.0)
            Text(text).lineLimit(nil)
        }.sheet(isPresented: self.$isShowingScannerSheet) { self.makeScannerView() }
    }
    
    @State private var isShowingScannerSheet = false
    @State private var text: String = ""
    
    private func openCamera() {
        isShowingScannerSheet = true
    }
    
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: { textPerPage in
            if let text = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                self.text = text
            }
            self.isShowingScannerSheet = false
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
