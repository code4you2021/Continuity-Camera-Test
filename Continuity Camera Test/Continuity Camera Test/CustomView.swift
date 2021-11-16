//
//  CustomView.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/16.
//

import Cocoa

class CustomView: NSView, NibLoadable {
    @IBOutlet var wrapView: CustomVisualEffectView!
    
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
//        self.layer?.backgroundColor = NSColor(red: 0.37, green: 0.63, blue: 1.00, alpha: 1.00).cgColor
        
        wrapView.layer?.backgroundColor = NSColor.keyboardFocusIndicatorColor.cgColor
        wrapView.material = .selection
        
    }
    
    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        wrapView.material = .menu
    }
}
