//
//  ViewController.swift
//  Font
//
//  Created by Nathan Mattes on 03.09.17.
//  Copyright © 2017 Nathan Mattes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var baseline: UIView!
    @IBOutlet weak var xHeightLine: UIView!
    @IBOutlet weak var ascenderLine: UIView!
    @IBOutlet weak var descenderLine: UIView!
    @IBOutlet weak var capHeightLine: UIView!
    @IBOutlet weak var pointSizeLine: UIView!

    @IBOutlet weak var xHeight: NSLayoutConstraint!
    @IBOutlet weak var ascender: NSLayoutConstraint!
    @IBOutlet weak var descender: NSLayoutConstraint!
    @IBOutlet weak var capHeight: NSLayoutConstraint!
    @IBOutlet weak var pointSize: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
        
    override func viewDidLoad() {
        self.updateElements()
    }
    
    func updateElements() {
        let font = UIFont.systemFont(ofSize: 35)
        
        xHeight.constant = font.xHeight
        ascender.constant = font.ascender
        descender.constant = font.descender // is negative
        capHeight.constant = font.capHeight
        pointSize.constant = font.pointSize
        
        label.font = font
        
        label.text = "pxX"
    }
    
}

