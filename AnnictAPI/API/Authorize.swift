//
//  Token.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

public class AnnictOAuthAuthorize: AnnictRequest {

    public typealias Response = String

    public var path: String {
        return "/oauth/authorize"
    }
    public var method: HTTPMethod {
        return .get
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        parameters["client_id"] = client_id
        parameters["redirect_uri"] = redirect_uri
        parameters["response_type"] = response_type
        parameters["scope"] = scope.description
        return parameters
    }

    init(client_id: String,
         response_type: String,
         redirect_uri: String,
         scope: AnnictScope) {
        self.client_id = client_id
        self.response_type = response_type
        self.redirect_uri = redirect_uri
        self.scope = scope
        
    }

    public enum AnnictScope: CustomStringConvertible {
        case read
        case readWrite

        public var description: String {
            switch self {
            case .read:
                return "read"
            case .readWrite:
                return "read+write"
            }
        }
    }

    var client_id: String
    var response_type: String
    var redirect_uri: String
    var scope: AnnictScope

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> String {
        throw AnnictError.parseError
    }
}
