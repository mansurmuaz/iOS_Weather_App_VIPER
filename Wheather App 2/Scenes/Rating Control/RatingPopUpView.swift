//
//  RatingPopUpView.swift
//  Weather App
//
//  Created by Mansur Muaz  Ekici on 11.07.2018.
//  Copyright © 2018 Adesso. All rights reserved.
//

import UIKit

@IBDesignable class RatingPopUpView: UIView {
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("RatingPopUpView", owner: self, options: nil)
        addSubview(popUpView)
        popUpView.frame = self.bounds
        popUpView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
