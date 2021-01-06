//
//  ViewController.swift
//  standup
//
//  Created by Anthony Gedeon on 1/4/21.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet var bottomLine: NSBox!
    @IBOutlet var soundChoice: NSPopUpButton!
    var toggleSound: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        bottomLine.shadow = NSShadow()
//        bottomLine.layer?.shadowRadius = 3.0
//        bottomLine.layer?.shadowOpacity = 1.0
//        bottomLine.layer?.shadowColor = NSColor.red.cgColor
//        bottomLine.layer?.shadowRadius = 15.0
//        bottomLine.layer?.shadowOffset = CGSize(width: 1, height: 3)
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
