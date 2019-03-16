//
//  ADSUtils.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 12.02.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import UIKit

class ADSUtils {

    // MARK: - Color

    static func getColor(red: CGFloat, greeen: CGFloat, blue: CGFloat) -> UIColor {
        return getColor(red: red, greeen: greeen, blue: blue, alpha: 1)
    }

    static func getColor(red: CGFloat, greeen: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: greeen / 255.0, blue: blue / 255.0, alpha: alpha)
    }

    // MARK: - ViewController

    static func changeWindowRootController(_ viewController: UIViewController) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            //            appDelegate.window?.subviews.forEach { $0.removeFromSuperview() }
            appDelegate.window?.rootViewController = viewController
            appDelegate.window?.makeKeyAndVisible()
        }
    }

    // MARK: - View

    static func getCharacterSpacingAttributedString(text: String?, space: Double) -> NSMutableAttributedString? {
        guard let string = text else {
            return nil
        }
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSAttributedStringKey.kern, value: space, range: NSRange(location: 0, length: attributedString.length))

        return attributedString
    }

    // MARK: - IP

    static func getWiFiAddress() -> String? {
        var address: String?

        // Get list of all interfaces on the local machine:
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if name == "en0" {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }

    static func isValidEmail(emailStr: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", ValidationConstants.emailRegEx)
        return emailTest.evaluate(with: emailStr)
    }
}
