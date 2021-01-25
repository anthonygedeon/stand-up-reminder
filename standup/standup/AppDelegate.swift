//
//  AppDelegate.swift
//  standup
//
//  Created by Anthony Gedeon on 1/4/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("StatusBarButtonStandImage"))
            button.action = #selector(togglePopover(_:))
        }
        
        popover.contentViewController = StandTimerViewController.freshController()
    
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            popover.
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }

}

