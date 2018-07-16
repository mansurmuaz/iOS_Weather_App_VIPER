//
//  NetworkModel.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation
import SwiftyJSON

enum GenericErrorType: String, Error {
    
    case reachability = "Has No Internet"
    case httpError = "Http Error"
    case somethingsWrong = "Somethings Wrong"
    case parseError = "Parsing Error"
    case tokenExpired = "Token Expired"
    
}

class ErrorModel: BaseModel {

    var errorCode: Int!
    var errorMessage: String!
    var errorType: ErrorType!
    var genericErrorType: GenericErrorType?

    required init(json: JSON) {
        super.init(json: json)

        errorCode = json["errorCode"].intValue
        errorMessage = json["errorMessage"].stringValue
        errorType = ErrorType(rawValue: json["errorType"].int8Value)
    }
    
    init(errorCode: Int, errorMessage: String, errorType: ErrorType) {
        super.init()
        
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.errorType = errorType
    }

    init(genericErrorType: GenericErrorType) {
        super.init()

        self.errorCode = 1000 + genericErrorType.hashValue
        self.errorMessage = genericErrorType.rawValue.localized
        self.errorType = ErrorType.generic
        self.genericErrorType = genericErrorType
    }
    
    init(errorCode: Int, genericErrorType: GenericErrorType) {
        super.init()
        
        self.errorCode = errorCode
        self.errorMessage = genericErrorType.rawValue.localized
        self.errorType = ErrorType.generic
        self.genericErrorType = genericErrorType
    }
    
}

enum ErrorType: Int8 {
    case unknown = 0
    case warning = 1
    case error = 2
    case generic = 3
}

extension ErrorType: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .unknown:
            return "unknown".localized
        case .warning:
            return "warning".localized
        case .error:
            return "error".localized
        case .generic:
            return "generic".localized
        }
    }
    
    public var localized: String {
        return description
    }
    
}
