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
    
    @IBOutlet var borderBottom: NSView!
    @IBOutlet var soundChoice: NSPopUpButton!
    var toggleSound: Bool = false

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
        
        borderBottom.layer?.cornerRadius = 5.0
        borderBottom.layer?.shadowColor = CGColor.white
        borderBottom.layer?.shadowPath = CGPath.init(rect: CGRect.init(x: 0, y: 0, width: 320, height: 1), transform: nil)
        borderBottom.layer?.shadowOffset = CGSize(width: 0, height: -5.0)
        borderBottom.layer?.shadowRadius = 5
        borderBottom.layer?.shadowOpacity = 1.0
        
    }
    
    @IBAction func playSound(_ sender: Any) {
        
        if let sound = soundChoice.selectedItem {
            print(sound.title)
            NSSound(named: sound.title)?.play()
        }
        
        if toggleSound {
            NSSound().stop()
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


