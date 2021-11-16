//
//  CustomView.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/16.
//

import Cocoa

class CustomView: NSView, NibLoadable {
    @IBOutlet var wrapView: CustomVisualEffectView!
    
    let appDelegate =  NSApplication.shared.delegate as? AppDelegate
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        print("draw")
        
        addTrackingArea(NSTrackingArea(rect: frame, options: [.activeAlways, .mouseEnteredAndExited], owner: self, userInfo: nil))
        
        wrapView.wantsLayer = true
        wrapView.layer?.cornerRadius = 4

    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        print("nib")
    }
    
    override func mouseEntered(with event: NSEvent) {
        super.mouseExited(with: event)
        print("mouseEntered")
        
        let position = NSEvent.mouseLocation
        
        print("position: ", position)
        
        wrapView.layer?.backgroundColor = NSColor.keyboardFocusIndicatorColor.cgColor
        wrapView.material = .selection
        
        
        
        
        appDelegate?.showContinuityCameraMenuItem(position)
        
    }
    
    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        wrapView.material = .menu
        
        appDelegate?.initContinuityCameraWindow()
    }
}
