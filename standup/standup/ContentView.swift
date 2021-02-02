//
//  ContentView.swift
//  StandUp
//
//  Created by Anthony Gedeon on 1/29/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let formatter = DateComponentsFormatter()
    let timeToKeepTrack = 900
    let soundToPlay = "Ping"
    
    @State private var isPlaying = false
    @State private var playControlImage = "play-icon"
    @State private var defaultTime = "15:00"
    @State private var timeRemainingInMinutes = 900
    @State private var progressMade: CGFloat = 0.0 /// start of progress ring
    @State private var isAppActive = true
    
    enum FontFamily: String {
        case bold = "Poppins-Bold"
        case semiBold = "Poppins-SemiBold"
        case medium = "Poppins-Medium"
        
        func font() -> String {
            return self.rawValue
        }
    }
    
    func reset() {
        isPlaying = false
        defaultTime = "15:00"
        timeRemainingInMinutes = timeToKeepTrack
        playControlImage = "play-icon"
        progressMade = 0.0
    }
    
    init() {
        reset()
        
        formatter.allowedUnits = [.minute, .second]
    }
    
    var body: some View {
        
        ZStack {
        
            Color(#colorLiteral(red: 0.965734899, green: 0.6711420417, blue: 0.1805486381, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .trailing, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Button(action: {
                    print("settings")
                    
                }, label: {
                    Image("settings-icon")
                        .scaledToFit()
                        .padding(.top, 0)
                        .padding(.trailing, 20)
                }).buttonStyle(PlainButtonStyle())
                
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
                            Text("\(defaultTime)")
                                .font(Font.custom(FontFamily.bold.font(), size: 62))
                                .foregroundColor(.white)
                                .onReceive(timer, perform: { _ in
                                    if isPlaying && timeRemainingInMinutes > 0 {
                                        timeRemainingInMinutes -= 1
                                        defaultTime = formatter.string(from: TimeInterval(timeRemainingInMinutes))!
    
                                        let progressRingIncrement = 1.0 / Double(timeToKeepTrack)
                                        progressMade += CGFloat(progressRingIncrement)
                                    }
                                    
                                    if defaultTime == "0" {
                                        print("play sound")
                                        NSSound(named: soundToPlay)?.play()
                                        reset()
                                    }
                                })
                                
                            
                            Text("Until stand up")
                                .font(Font.custom(FontFamily.medium.font(), size: 14))
                                .foregroundColor(Color(#colorLiteral(red: 0.9925253987, green: 0.8607291579, blue: 0.7022601962, alpha: 1)))
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

                    
                    Circle()
                        .trim(from: 0, to: progressMade)
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
                            
                    Circle()
                        .trim(from: progressMade, to: progressMade + 0.0001)
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
                
                
                
            }).padding(.bottom, 48)
            
            if isPlaying {
                
                VStack(alignment: .center, content: {
                    
                    Button(action: {
                        reset()
                    }, label: {
                        Text("cancel").font(Font.custom(FontFamily.medium.font(), size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 0.9925253987, green: 0.8607291579, blue: 0.7022601962, alpha: 1)))
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 14)
                
            }
        }
        .frame(width: 340, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
