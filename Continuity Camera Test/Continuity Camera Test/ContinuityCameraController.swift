//
//  ContinuityCameraController.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/16.
//

import Cocoa

class ContinuityCameraController: NSViewController, NSServicesMenuRequestor {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    override func loadView() {
        view = NSView()
    }

    override func validRequestor(forSendType sendType: NSPasteboard.PasteboardType?, returnType: NSPasteboard.PasteboardType?) -> Any? {
        if let pasteboardType = returnType,
           NSImage.imageTypes.contains(pasteboardType.rawValue)
        {
            return self
        } else {
            return super.validRequestor(forSendType: sendType, returnType: returnType)
        }
    }

    func readSelection(from pasteboard: NSPasteboard) -> Bool {
        guard pasteboard.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else { return false }

        guard NSImage(pasteboard: pasteboard) != nil else { return false }

        return true
    }
}
