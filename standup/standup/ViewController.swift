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
    
    var toggleSound = false
    var timerReached = 0
    
    override func viewWillAppear() {
        let color: CGFloat = 0.05
        super.viewWillAppear()
        view.window?.isOpaque = true
        view.window?.backgroundColor = NSColor(red: color, green: color, blue: color, alpha: 0.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in sounds {
            soundChoice.addItem(withTitle: sound)
        }
        
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
    
    func playPickedSound() {
        if let sound = self.soundChoice.selectedItem {
            NSSound(named: sound.title)?.play()
        }
    }
    
    func stopPlayingSound() {
        if toggleSound {
            NSSound().stop()
        }
    }
    
    @IBAction func playSound(_ sender: Any) {
        self.playPickedSound()
        self.stopPlayingSound()
    }
    
    @IBAction func rangeSlider(_ sender: NSSlider) {
        
        var timeInSeconds: TimeInterval
        
        let currentValue = sender.integerValue
        
        if currentValue == 0 {
            notifyText.stringValue = "Notify on the hour"
            timeInSeconds = 3600
        } else {
            notifyText.stringValue = "Notify at \(currentValue) minutes past"
            timeInSeconds = Double(currentValue) * 60
        }
        
        print(timeInSeconds)
    
        var _ = Timer.scheduledTimer(withTimeInterval: timeInSeconds, repeats: true) { timer in
            
            if self.toggleSound {
                timer.invalidate()
            } else {
            
                print("Timer has started")
                
                self.playPickedSound()
            }
            

        }
        
    }
    
    @IBAction func checkbox(_ sender: Any) {
        toggleSound = !toggleSound
        soundChoice.isHidden = toggleSound
    }
    
}


