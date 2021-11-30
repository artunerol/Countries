//
//  SaveButton.swift
//  Countries
//
//  Created by Artun Erol on 28.11.2021.
//

import Foundation
import UIKit

class SaveButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func saveButtonSelected(for country: String) { //If saveButton is selected, set value for current country as true
        setImage(UIImage(systemName: "star.fill"), for: .normal)
        UserDefaults.standard.set(true, forKey: "\(country)")
    }
    
    func saveButtonUnselected(for country: String) { //If saveButton is selected, set value for current country as false
        setImage(UIImage(systemName: "star"), for: .normal)
        UserDefaults.standard.set(false, forKey: "\(country)")
    }
    
}
