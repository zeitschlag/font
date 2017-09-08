//
//  ViewModel.swift
//  Font
//
//  Created by Nathan Mattes on 08.09.17.
//  Copyright © 2017 Nathan Mattes. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    var fontSize: CGFloat {
        didSet {
            let fontName = self.font.fontName
            self.font = UIFont(name: fontName, size: self.fontSize)!
        }
    }
    var text: String?
    var font: UIFont
    
    init(fontSize: CGFloat, text: String, font: UIFont) {
        self.fontSize = fontSize
        self.text = text
        self.font = font
    }
}
