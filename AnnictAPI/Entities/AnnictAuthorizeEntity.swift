//
//  AuthorizeEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

final class AnnictAuthorizeEntity {
    var access_token: String
    var token_type: String
    var scope: String
    var created_at: Date

    required init(access_token: String,
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
