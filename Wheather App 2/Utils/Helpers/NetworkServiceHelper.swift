//
//  NetworkServiceHelper.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation

class NetworkServiceHelper {

    static func getUrl(with url: String, parameters: [(key: String, value: String)]) -> URL {
        var components = URLComponents(string: url)
        if parameters.count > 0 {
            components?.queryItems = []
        }
        for param in parameters {
            components?.queryItems?.append(URLQueryItem(name: param.key, value: param.value))
        }

        return components!.url!
    }
}
