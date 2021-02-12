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
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
    }
    
    var body: some View {
        
        ZStack {
        
            Color(#colorLiteral(red: 0.03828236833, green: 0.02331713773, blue: 0.06831399351, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .trailing, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Button(action: {
                    print("settings")
                    
                }, label: {
                    Image("more-icon")
                        .scaledToFit()
                        .padding(.top, 0)
                        .padding(.trailing, 20)
                }).buttonStyle(PlainButtonStyle())
                
                ZStack {
                    
                        Circle()
                            .stroke(
                                Color(#colorLiteral(red: 0.1098371074, green: 0.1097947285, blue: 0.1139102057, alpha: 1)),
                                style: StrokeStyle(lineWidth: 10,
                                                   lineCap: .round,
                                                   lineJoin: CGLineJoin.miter,
                                                   miterLimit: 0,
                                                   dashPhase: 0
                                )
                            )
                    
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                            
                            Text("stand in")
                                .font(Font.custom(FontFamily.medium.font(), size: 14))
                                .foregroundColor(Color(#colorLiteral(red: 0.4145596325, green: 0.4039255083, blue: 0.4037293196, alpha: 1)))
                            
                            Text("\(defaultTime)")
                                .font(Font.custom(FontFamily.bold.font(), size: 62))
                                .foregroundColor(.white)
                                .onReceive(NotificationCenter.default.publisher(for: NSWindow.didMiniaturizeNotification)) { _ in
                                    
                                }
                                .onReceive(NotificationCenter.default.publisher(for: NSWindow.didBecomeMainNotification)) { _ in
                
                                }
                                .onReceive(timer, perform: { _ in
                                    if isPlaying && timeRemainingInMinutes > 0 {
                                        timeRemainingInMinutes -= 1
                                        defaultTime = formatter.string(from: TimeInterval(timeRemainingInMinutes))!
    
                                        let progressRingIncrement = 1.0 / Double(timeToKeepTrack)
                                        progressMade += CGFloat(progressRingIncrement)
                                    }
                                    
                                    if defaultTime == "00:00" {
                                        print("play sound")
                                        NSSound(named: soundToPlay)?.play()
                                        reset()
                                    }
                                })
                                
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
                            Color(#colorLiteral(red: 0.9557656646, green: 0.2603653669, blue: 0.08132243901, alpha: 1)),
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
                            Color(#colorLiteral(red: 0.9557656646, green: 0.2603653669, blue: 0.08132243901, alpha: 1)),
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
                        Text("Stop".uppercased()).font(Font.custom(FontFamily.medium.font(), size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 0.9557656646, green: 0.2603653669, blue: 0.08132243901, alpha: 1)))
                            
                        
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
