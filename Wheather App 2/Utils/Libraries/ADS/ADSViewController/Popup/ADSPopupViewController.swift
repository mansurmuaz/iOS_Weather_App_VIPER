//
//  ADSAlertViewController.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 27.02.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import UIKit

enum ADSPopupType {
    case success
    case warning
    case error
}

enum ADSPopupCloseType {
    case close
    case done
    case yes
    case no
}

typealias ADSPopupCompletionHandler = (_ closeType: ADSPopupCloseType) -> Void

class ADSPopupViewController: ADSViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var backButton: ADSButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: ADSLabel!
    @IBOutlet weak var descriptionLabel: ADSLabel!
    @IBOutlet weak var doneButton: ADSButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var noButton: ADSButton!
    @IBOutlet weak var yesButton: ADSButton!
    
    // MARK: - Properties
    
    var completionHandler: ADSPopupCompletionHandler?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Initialization
    
    func showSingleChoice(popupType: ADSPopupType, title: String, message: String, doneTitle: String, completionHandler: ADSPopupCompletionHandler?) {
        showPopup(popupType: popupType, title: title, message: message, completionHandler: completionHandler)
        
        doneButton.isHidden = false
        stackView.isHidden = true
        
        doneButton.setTitle(doneTitle, for: .normal)
    }
    
    func showMultipleChoice(popupType: ADSPopupType, title: String, message: String, yesTitle: String, noTitle: String, completionHandler: ADSPopupCompletionHandler?) {
        showPopup(popupType: popupType, title: title, message: message, completionHandler: completionHandler)
        
        stackView.isHidden = false
        doneButton.isHidden = true
        
        yesButton.setTitle(yesTitle, for: .normal)
        noButton.setTitle(noTitle, for: .normal)
    }
    
    fileprivate func showPopup(popupType: ADSPopupType, title: String, message: String, completionHandler: ADSPopupCompletionHandler?) {
        self.completionHandler = completionHandler
        
        titleLabel.text = title
        descriptionLabel.text = message
        
        switch popupType {
        case .success:
            imageView.image = UIImage(named: "icon_success")
        case .warning:
            imageView.image = UIImage(named: "icon_error")
        case .error:
            imageView.image = UIImage(named: "icon_error")
        }
    }
    
    // MARK: - Business
    
    func closePopup(closeType: ADSPopupCloseType) {
        if let completionHandler = self.completionHandler {
            completionHandler(closeType)
        }
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        closePopup(closeType: ADSPopupCloseType.close)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        closePopup(closeType: ADSPopupCloseType.done)
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        closePopup(closeType: ADSPopupCloseType.yes)
    }
    @IBAction func noButtonTapped(_ sender: Any) {
        closePopup(closeType: ADSPopupCloseType.no)
    }
    
}
