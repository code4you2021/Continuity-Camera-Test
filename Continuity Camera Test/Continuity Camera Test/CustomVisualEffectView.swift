//
//  CustomVisualEffectView.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/16.
//

import Cocoa

class CustomVisualEffectView: NSVisualEffectView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        print("CustomVisualEffectView")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("CustomVisualEffectView")
        self.material = .menu
        self.state = .active
        self.blendingMode = .behindWindow
        self.isEmphasized = true
    }
    
}
