//
//  ContinuityCameraMenuItem.swift
//  Continuity Camera Test
//
//  Created by Apple on 2021/11/16.
//

import Cocoa

class ContinuityCameraMenuItem: NSMenuItem  {
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(title string: String, action selector: Selector?, keyEquivalent charCode: String) {
        super.init(title: string, action: selector, keyEquivalent: charCode)
    }
    
}
