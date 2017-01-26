//
//  AuthorizeEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public final class AnnictAuthorizeEntity {
    public var access_token: String
    public var token_type: String
    public var scope: String
    public var created_at: Date

    required public init(access_token: String,
                  token_type: String,
                  scope: String,
                  created_at: Date
        ) {
        self.access_token = access_token
        self.token_type = token_type
        self.scope = scope
        self.created_at = created_at
    }
}

extension AnnictAuthorizeEntity: Decodable {
    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ e: Extractor) throws -> AnnictAuthorizeEntity {
        return try self.init(
            access_token: e <| "access_token",
            token_type: e <| "token_type",
            scope: e <| "scope",
            created_at: e <| "created_at")
    }
}
