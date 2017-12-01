//
//  Request+Error.swift
//  UberGoCore
//
//  Created by Nghia Tran on 9/13/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - Error Hanlding
extension Request {

    func handleValidation(_ response: DataResponse<Any>?) -> NSError? {

        // No Response
        guard let innerResponse = response?.response else {
            return NSError(domain: "Error", code: 500, userInfo: nil)
        }

        // Default status code
        let statusCode = innerResponse.statusCode

        if 200...300 ~= statusCode {
            return nil
        }

        return NSError(domain: "Error", code: statusCode, userInfo: nil)
    }
}
