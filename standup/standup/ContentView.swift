//
//  ContentView.swift
//  StandUp
//
//  Created by Anthony Gedeon on 1/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.965734899, green: 0.6711420417, blue: 0.1805486381, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .trailing, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Image("settings-icon")
                    .scaledToFit()
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                    
                ZStack {
                    HStack {
                        Circle()
                            .stroke(
                                Color(#colorLiteral(red: 0.9925253987, green: 0.8607291579, blue: 0.7022601962, alpha: 1)),
                                style: StrokeStyle(lineWidth: 10,
                                                   lineCap: .round,
                                                   lineJoin: CGLineJoin.miter,
                                                   miterLimit: 0,
                                                   dashPhase: 0
                                )
                            )
                    }
                    
                    HStack {
                        Circle()
                            .trim(from: 0, to: 0.0001)
                            .stroke(
                                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                                style: StrokeStyle(lineWidth: 10,
                                                   lineCap: .round,
                                                   lineJoin: CGLineJoin.miter,
                                                   miterLimit: 0,
                                                   dashPhase: 0
                                )
                            )
                            .rotationEffect(.degrees(270.0))
                    }
                    
                }
                
            })

        }
        
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
