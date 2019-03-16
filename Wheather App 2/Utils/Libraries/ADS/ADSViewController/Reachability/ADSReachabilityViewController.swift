//
//  ReachabilityViewController.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 27.02.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import UIKit

class ADSReachabilityViewController: ADSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Actions
    
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
