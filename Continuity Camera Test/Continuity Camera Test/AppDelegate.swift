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

        let importMenuItem = NSMenuItem(title: "Take Picture", action: nil, keyEquivalent: "")
        importMenuItem.identifier = NSMenuItem.importFromDeviceIdentifier
        mainMenu.addItem(importMenuItem)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    override func validRequestor(forSendType sendType: NSPasteboard.PasteboardType?, returnType: NSPasteboard.PasteboardType?) -> Any? {
        return self
    }

    func readSelection(from pasteboard: NSPasteboard) -> Bool {
        guard pasteboard.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else { return false }

        guard let image = NSImage(pasteboard: pasteboard) else { return false }

        print("took picture!\r\(image)")

        return true
    }
}
