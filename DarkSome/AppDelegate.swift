//
//  AppDelegate.swift
//  DarkSome
//
//  Created by Dennis Kruyt on 06/09/2018.
//  Copyright © 2018 Dennis Kruyt. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    var item : NSStatusItem? = nil
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        enum InterfaceStyle : String {
            case Dark, Light
            
            init() {
                let type = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
                self = InterfaceStyle(rawValue: type)!
            }
        }
        
        let currentStyle = InterfaceStyle()
        
        item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if currentStyle == .Light {
            item?.image = NSImage(named:NSImage.Name("moon"))
        }
        if currentStyle == .Dark {
            item?.image = NSImage(named:NSImage.Name("sun"))
        }
        
        if let button = item?.button {
            button.action = #selector(self.doSomeAction(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        
        func applicationWillTerminate(_ aNotification: Notification) {
            // Insert code here to tear down your application
        }
    }
    
    @objc func switchMode() {
        DarkMode.toggle()
        
        enum InterfaceStyle : String {
            case Dark, Light
            
            init() {
                let type = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
                self = InterfaceStyle(rawValue: type)!
            }
        }
        
        let currentStyle = InterfaceStyle()
        
        if currentStyle == .Light {
            item?.image = NSImage(named:NSImage.Name("moon"))
        }
        if currentStyle == .Dark {
            item?.image = NSImage(named:NSImage.Name("sun"))
        }
        
    }
    
    @objc func doSomeAction(sender: NSStatusItem) {
        
        let event = NSApp.currentEvent!
        
        if event.type == NSEvent.EventType.rightMouseUp{
            //print ("Right button click")
            NSApplication.shared.terminate(self)
            
        } else {
            //print ("Left button click")
            switchMode()
        }
    }
    
    
}



