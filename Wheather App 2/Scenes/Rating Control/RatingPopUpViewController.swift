//
//  RatingPopUpViewController.swift
//  Weather App
//
//  Created by Mansur Muaz  Ekici on 12.07.2018.
//  Copyright © 2018 Adesso. All rights reserved.
//

import UIKit

protocol RatingPopUpViewControllerDelegate: class {
    
    func didTapSendButton(rating: Int)
}

class RatingPopUpViewController: UIViewController {

    @IBOutlet weak var ratingPopUpView: RatingPopUpView!

    weak var ratingDelegate: RatingPopUpViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingPopUpView.layer.cornerRadius = 10
        
        ratingPopUpView.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        ratingPopUpView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func sendButtonTapped() {
        
        let rating = ratingPopUpView.ratingControl.rating
        ratingDelegate?.didTapSendButton(rating: rating)
        dismiss(animated: true, completion: nil)
    }
    
}
