//
//  BaseModel.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 18.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseModel {

    init() {}
    required init(json _: JSON) {}

    func toJSON() -> JSON? {
        return nil
    }

    static func toModels<M: BaseModel>(json: JSON) -> [M] {
        return json.arrayValue.map({ M(json: $0) })
    }
}
