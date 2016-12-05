//
//  Token.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public final class AnnictOAuthToken: AnnictRequest {

    public typealias Response = AnnictAuthorizeEntity

    public var path: String {
        return "/oauth/token"
    }
    public var method: HTTPMethod {
        return .post
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        parameters["client_id"] = client_id
        parameters["client_secret"] = client_secret
        parameters["grant_type"] = grant_type
        parameters["redirect_uri"] = redirect_uri
        parameters["code"] = code

        return parameters
    }

    var client_id: String
    var client_secret: String
    var grant_type: String
    var redirect_uri: String
    var code: String

    init(client_id: String,
         client_secret: String,
         grant_type: String,
         redirect_uri: String,
         code: String) {
        self.client_id = client_id
        self.client_secret = client_secret
        self.grant_type = grant_type
        self.code = code
        self.redirect_uri = redirect_uri
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictAuthorizeEntity {
        return try Response.decodeValue(object)
    }
}
