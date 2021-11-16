//
//  AppDelegate.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/13.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    let mainMenu = NSMenu()
    let window = NSWindow()
    let continuityCameraController = ContinuityCameraController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        // init
        initContinuityCameraWindow()

        guard let button = statusItem.button else {
            return
        }

        button.image = NSImage(named: "status")
        button.image?.isTemplate = true

        statusItem.menu = mainMenu
        
        
        let menuItem1 = NSMenuItem(title: "menuItem1", action: nil, keyEquivalent: "")
        mainMenu.addItem(menuItem1)
        
        let menuItem2 = NSMenuItem(title: "menuItem2", action: nil, keyEquivalent: "")
        mainMenu.addItem(menuItem2)

        let importMenuItem = NSMenuItem(title: "Take Picture", action: nil, keyEquivalent: "")
        importMenuItem.view = CustomView.createFromNib()

        mainMenu.addItem(importMenuItem)
        
        let menuItem3 = NSMenuItem(title: "menuItem3", action: nil, keyEquivalent: "")
        mainMenu.addItem(menuItem3)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func initContinuityCameraWindow() {
        window.contentViewController = continuityCameraController
        window.canHide = true
        window.hidesOnDeactivate = true
        window.collectionBehavior = .canJoinAllSpaces
        window.center()
        window.makeKeyAndOrderFront(nil)
    }

    func showContinuityCameraMenuItem(_ point: NSPoint) {
        print("showContinuityCameraMenuItem: ", NSApplication.shared.currentEvent)

//        guard let event = NSApplication.shared.currentEvent else {
//            return
//        }

        let location = window.convertPoint(fromScreen: point)
        
        print("location: ", location)
        
        guard let event = NSEvent.mouseEvent(with: .leftMouseUp, location: location, modifierFlags: .init(), timestamp: .init(), windowNumber: window.windowNumber, context: nil, eventNumber: 0, clickCount: 0, pressure: 0) else {
            return
        }
        

        print("event: ", event)


        let menu = NSMenu()
        NSApplication.shared.activate(ignoringOtherApps: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.window.center()
//            self.window.makeKeyAndOrderFront(nil)
            self.window.makeFirstResponder(self.continuityCameraController)
            NSMenu.popUpContextMenu(menu, with: event, for: self.continuityCameraController.view)
        }
    }
}
