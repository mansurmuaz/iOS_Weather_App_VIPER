//
//  SettingsViewController.swift
//  Wheather App 2
//
//  Created by Mansur Muaz  Ekici on 18.07.2018.
//  Copyright © 2018 Adesso. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var unitSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setRightBarButton(UIBarButtonItem(image: #imageLiteral(resourceName: "credits"), style: .done, target: self, action: #selector(displayCreditsView)), animated: true)
        
        unitSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
        
        setSwitchState()
    }
    
    @objc func displayCreditsView() {
        if let navigationController = self.navigationController {
            let cVC = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreditsViewController")
            if let creditsVC = cVC as? CreditsViewController {
                navigationController.pushViewController(creditsVC, animated: true)
            }
        }
    }
    
    func setSwitchState() {
        if let unit = UserDefaults.standard.string(forKey: "unit") {
            switch unit {
            case "metric":
                unitSwitch.setOn(false, animated: true)
            case "imperial":
                unitSwitch.setOn(true, animated: true)
            default:
                unitSwitch.setOn(false, animated: true)
            }
        }
    }
    
    @objc func stateChanged() {
        if unitSwitch.isOn {
            UserDefaults.standard.set("imperial", forKey: "unit")
        } else {
            UserDefaults.standard.set("metric", forKey: "unit")
        }
    }
}
