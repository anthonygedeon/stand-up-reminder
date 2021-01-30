//
//  ContentView.swift
//  StandUp
//
//  Created by Anthony Gedeon on 1/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    @State var playControlImage = "play-icon"
    
    var body: some View {

        ZStack {
        
            Color(#colorLiteral(red: 0.965734899, green: 0.6711420417, blue: 0.1805486381, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .trailing, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Image("settings-icon")
                    .scaledToFit()
                    .padding(.top, 0)
                    .padding(.trailing, 20)
                
                ZStack {
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
                    
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                            Text("15:00")
                                .font(.system(size: 72))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                
                            Text("Until stand up")
                                .font(.system(size: 14))
                                .foregroundColor(Color(#colorLiteral(red: 0.9925253987, green: 0.8607291579, blue: 0.7022601962, alpha: 1)))
                                .fontWeight(.medium)
                                .padding(.bottom, 8)
                            
                            Button(action: {
                                isPlaying = !isPlaying
                                
                                if isPlaying {
                                    playControlImage = "pause-icon"
                                } else {
                                    playControlImage = "play-icon"
                                }
                                
                            }, label: {
                                    Image(playControlImage)
                                        .scaledToFit()
                                        .font(.system(size: 40))
                            })
                            .buttonStyle(PlainButtonStyle())
                                     
                        })

                    HStack {
                        Circle()
                            .trim(from: 0, to: 0.50)
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
                    
                    HStack {
                        Circle()
                            .trim(from: 0.499, to: 0.50)
                            .stroke(
                                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                                style: StrokeStyle(lineWidth: 21,
                                                   lineCap: .round,
                                                   lineJoin: CGLineJoin.miter,
                                                   miterLimit: 0,
                                                   dashPhase: 0
                                )
                                
                            )
                            .rotationEffect(.degrees(270.0))
                            
                    }
                    
                }
                
            }).padding(.bottom, 32)

        }
        .frame(width: 340, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
