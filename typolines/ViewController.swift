//
//  ViewController.swift
//  Font
//
//  Created by Nathan Mattes on 03.09.17.
//  Copyright © 2017 Nathan Mattes. All rights reserved.
//

import UIKit

struct DefaultValues {
    static let Size: CGFloat = 22.0
    static let Text = "Hello, world!"
}

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
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
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pointSizeLabel: UILabel!
    
    //MARK: - Properties
    var viewModel = ViewModel(fontSize: DefaultValues.Size, text: DefaultValues.Text, font: UIFont.systemFont(ofSize: DefaultValues.Size))
    
    //MARK: -
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textFieldTextDidChange(_:)), name: .UITextFieldTextDidChange, object: self.textField)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        setupElements()
        updateElements()
    }
    
    private func setupElements() {
        ascenderLine.backgroundColor = .blue
        descenderLine.backgroundColor = .blue
        xHeightLine.backgroundColor = .red
        capHeightLine.backgroundColor = .red
        pointSizeLine.backgroundColor = .green
        
        fontSizeSlider.setValue(Float(DefaultValues.Size), animated: false)
        
        pointSizeLabel.text = "\(viewModel.fontSize) pt"
    }
    
    fileprivate func updateElements() {
        let font = viewModel.font
        
        label.font = font
        label.text = viewModel.text
        
        xHeight.constant = font.xHeight
        ascender.constant = font.ascender
        descender.constant = font.descender // is negative
        capHeight.constant = font.capHeight
        pointSize.constant = font.pointSize
        
        label.text = viewModel.text
        textField.text = viewModel.text
    }
    
    //MARK: - Actions
    
    @IBAction func fontSizeSliderValueChanged(_ sender: Any) {
        
        guard let sender = sender as? UISlider else {
            return
        }
        
        let sliderValue = floorf(sender.value)
        viewModel.fontSize = CGFloat(sliderValue)
        
        pointSizeLabel.text = "\(viewModel.fontSize) pt"
        
        updateElements()
    }
    
    //MARK: - Notifications
    func textFieldTextDidChange(_ notification: Notification) {
        guard let textField = notification.object as? UITextField else {
            return
        }
        
        guard textField == self.textField else {
            return
        }
        
        viewModel.text = textField.text
        
        updateElements()
    }
    
}

//MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UIFont.familyNames.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UIFont.familyNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedFontName = UIFont.familyNames[row]
        
        guard let font = UIFont(name: selectedFontName, size: viewModel.fontSize) else {
            return
        }
        
        viewModel.font = font
        updateElements()
        
        
    }
}

