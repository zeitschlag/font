//
//  ViewModel.swift
//  Font
//
//  Created by Nathan Mattes on 08.09.17.
//  Copyright © 2017 Nathan Mattes. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    var fontSize: CGFloat
    var text: String?
    
    init(fontSize: CGFloat, text: String) {
        self.fontSize = fontSize
        self.text = text
    }
}
