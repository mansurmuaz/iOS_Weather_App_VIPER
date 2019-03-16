//
//  NetworkService.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {

    typealias SuccessCompletionHandler = (_ result: JSON) -> Void
    typealias FailureCompletionHandler = (ErrorModel) -> Void

    static let sharedInstance = NetworkService()

    let sessionManager = SessionManager.default
    
    fileprivate var reachabilityManager: NetworkReachabilityManager?
    var reachabilityStatus: NetworkReachabilityManager.NetworkReachabilityStatus = .unknown
    
    private init() { }
    
    func startReachability(listener: NetworkReachabilityManager.Listener? = nil) {
        reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
        reachabilityManager?.listener = { status in
            self.reachabilityStatus = status
            
            if let listener = listener {
                listener(status)
            }
        }
        reachabilityManager?.startListening()
    }
    
    func stopReachabilityManager() {
        reachabilityManager?.stopListening()
    }

    // MARK: - Base

    func getJSON(url: URLConvertible, useToken: Bool = false, parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                 success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        
        callJSON(method: .get, url: url, useToken: useToken, parameters: parameters, headers: headers, success: success, failure: failure)
    }

    func postJSON(url: URLConvertible, useToken: Bool = false, parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                  success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        callJSON(method: .post, url: url, useToken: useToken, parameters: parameters, headers: headers, success: success, failure: failure)
    }
    
    fileprivate func callJSON(method: HTTPMethod, url: URLConvertible, useToken: Bool = false,
                              parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                              success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        if isInternetAvailable() {
            let headerParameters = addHeaders(token: useToken ? NetworkService.getToken() : nil, headers: headers)
            
            sessionManager.request(url, method: method, parameters: parameters,
                                   encoding: JSONEncoding.default, headers: headerParameters)
                .validate(statusCode: [200]).responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                            success(json)
                        
                    case .failure:
                        self.handleHttpError(response.response, success: success, failure: failure)
                    }
                })
        } else {
            failure(ErrorModel(genericErrorType: GenericErrorType.reachability))
        }
    }
    
    func isInternetAvailable() -> Bool {
        switch reachabilityStatus {
        case .notReachable:
            return false
        case .unknown:
            return true
        case .reachable(.ethernetOrWiFi):
            return true
        case .reachable(.wwan):
            return true
        }
    }

    func addHeaders(token: String?, headers: [String: String]? = nil) -> [String: String]? {
        var headerParameters: [String: String]?

        if let defaultHeaders = NetworkService.defaultHeaders() {
            headerParameters = defaultHeaders
        }

        if let parameters = headers {
            if headerParameters == nil {
                headerParameters = [String: String]()
            }
            headerParameters?.merge(parameters, uniquingKeysWith: { $1 })
        }

        if let token = token {
            if headerParameters == nil {
                headerParameters = [String: String]()
            }
            headerParameters?.merge(["token": token], uniquingKeysWith: { $1 })
        }
        return headerParameters
    }
    
    func handleError(_ json: JSON, success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        failure(ErrorModel(json: json))
    }
    
    func handleHttpError(_ response: HTTPURLResponse?, success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
        if let statusCode = response?.statusCode {
            failure(ErrorModel(errorCode: statusCode, genericErrorType: GenericErrorType.somethingsWrong))
        } else {
            failure(ErrorModel(genericErrorType: GenericErrorType.somethingsWrong))
        }
    }

    static func defaultHeaders() -> [String: String]? {
        return nil
    }

    static func getToken() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultConstants.token)
    }
}
