//
//  AnnictUserEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

class AnnictUserEntity {
    var id: String
    var username: String
    var name: String
    var description: String
    var url: URL?
    var records_count: Int
//    TODO: Date型にする
    var created_at: String

    required init(
        id: String,
        username: String,
        name: String,
        description: String,
        url: URL?,
        records_count: Int,
        created_at: String
        ) {
        self.id = id
        self.username = username
        self.name = name
        self.description = description
        self.url = url
        self.records_count = records_count
        self.created_at = created_at
    }
}

extension AnnictUserEntity: Decodable {
    static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            id: e <| "id",
            username: e <| "username",
            name: e <| "name",
            description: e <| "description",
            url: e <|? "url",
            records_count: e <| "records_count",
            created_at: e <| "created_at")
    }
}
