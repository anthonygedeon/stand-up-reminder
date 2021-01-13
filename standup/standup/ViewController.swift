//
//  ViewController.swift
//  standup
//
//  Created by Anthony Gedeon on 1/4/21.
//

import Cocoa

let sounds = [
    "Basso",
    "Blow",
    "Frog",
    "Glass",
    "Hero",
    "Morse",
    "Ping",
    "Pop",
    "Purr",
    "Sosumi",
    "Submarine",
    "Funk"
]

class ViewController: NSViewController {
    
    @IBOutlet var notifyText: NSTextField!
    @IBOutlet var borderBottom: NSView!
    @IBOutlet var soundChoice: NSPopUpButton!
    var toggleSound: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in sounds {
            soundChoice.addItem(withTitle: sound)
        }
        
        print(Timer().fire())
        
        // what does this do???
        view.wantsLayer = true
        view.superview?.wantsLayer = true
        
        borderBottom.wantsLayer = true
        borderBottom.shadow = NSShadow()
        
        let height: CGFloat = 1
        let width: CGFloat = 280
        let shadowSize: CGFloat = 50
        let contactRect = CGRect(x: -shadowSize, y: height - (shadowSize * 0.4), width: width + shadowSize * 2, height: shadowSize)
        borderBottom.layer?.cornerRadius = 5.0
        borderBottom.layer?.shadowColor = CGColor.white
        borderBottom.layer?.shadowPath = CGMutablePath(ellipseIn: contactRect, transform: nil)
        borderBottom.layer?.shadowOffset = CGSize(width: 0, height: -5.0)
        borderBottom.layer?.shadowRadius = 5
        borderBottom.layer?.shadowOpacity = 0.1
        
    }
    
    @IBAction func playSound(_ sender: Any) {
        
        if let sound = soundChoice.selectedItem {
            NSSound(named: sound.title)?.play()
        }
        
        if toggleSound {
            NSSound().stop()
        }
        
    }
    
    @IBAction func rangeSlider(_ sender: NSSlider) {

        let currentValue = sender.integerValue
        
        if currentValue == 0 {
            notifyText.stringValue = "Notify on the hour"
        } else {
            notifyText.stringValue = "Notify at \(currentValue) minutes past"
        }
        
        var totalTime = currentValue * 60
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { time in
            print("time start")
            
            totalTime -= 1
            
            print(totalTime)
            
            if totalTime == 0 {
                time.invalidate()
                if let sound = self.soundChoice.selectedItem {
                    NSSound(named: sound.title)?.play()
                }
                
                if self.toggleSound {
                    NSSound().stop()
                }

            }
            
        }
    
    }
    
    @IBAction func checkbox(_ sender: Any) {
        toggleSound = !toggleSound
        soundChoice.isHidden = toggleSound
    }
    
    override func viewWillAppear() {
        let color: CGFloat = 0.05
        super.viewWillAppear()
        view.window?.isOpaque = true
        view.window?.backgroundColor = NSColor(red: color, green: color, blue: color, alpha: 0.8)
    }
}


