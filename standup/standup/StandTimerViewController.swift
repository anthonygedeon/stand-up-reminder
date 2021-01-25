//
//  StandTimerViewController.swift
//  standup
//
//  Created by Anthony Gedeon on 1/24/21.
//

import Cocoa

extension StandTimerViewController {
    
    static func freshController() -> StandTimerViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"),
                                      bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("StandTimerViewController")
        
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? StandTimerViewController else {
                fatalError("Why cant I find StandTimerViewController - Check Main.storyboard")
        }
        
        return viewController
    }
    
}

class StandTimerViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
    }
    
}
