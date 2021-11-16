//
//  AppDelegate.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/13.
//

import Cocoa

@main
class AppDelegate: NSResponder, NSApplicationDelegate, NSServicesMenuRequestor {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    let mainMenu = NSMenu()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        guard let button = statusItem.button else {
            print("button")
            return
        }

        button.image = NSImage(named: "status")
        button.image?.isTemplate = true

        statusItem.menu = mainMenu
        
        let menuItem1 = NSMenuItem(title: "menuItem1", action: #selector(test(sender:)), keyEquivalent: "")
        mainMenu.addItem(menuItem1)

        
        let importMenuItem = NSMenuItem(title: "Take Picture", action: nil, keyEquivalent: "")
//        let customView =
        importMenuItem.view = CustomView.createFromNib()
        
        
        mainMenu.addItem(importMenuItem)
    }

    @objc func test(sender: AnyObject) {
       
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    override func validRequestor(forSendType sendType: NSPasteboard.PasteboardType?, returnType: NSPasteboard.PasteboardType?) -> Any? {
        if let pasteboardType = returnType,
           NSImage.imageTypes.contains(pasteboardType.rawValue)
        {
            return mainMenu
        } else {
            return super.validRequestor(forSendType: sendType, returnType: returnType)
        }
    }

    func readSelection(from pasteboard: NSPasteboard) -> Bool {
        guard pasteboard.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else { return false }

        guard let image = NSImage(pasteboard: pasteboard) else { return false }

        print("took picture!\r\(image)")

        return true
    }
}
