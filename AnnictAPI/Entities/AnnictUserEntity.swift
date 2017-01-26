//
//  AnnictUserEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictUserEntity: Object {
    dynamic var id: Int = 0
    dynamic var username: String = ""
    dynamic var name: String = ""
    dynamic var description_: String = ""
    dynamic var _url: String? = nil
    lazy var url: URL? = {
        guard let url_str = self._url else { return nil }
        return URL(string: url_str)
    }()
    dynamic var records_count: Int = 0
//    TODO: Date型にする
    dynamic var created_at: String = ""

    convenience public init(
        id: Int,
        username: String,
        name: String,
        description: String,
        url: URL?,
        records_count: Int,
        created_at: String
        ) {
        self.init()
        self.id = id
        self.username = username
        self.name = name
        self.description_ = description
        self.url = url
        self.records_count = records_count
        self.created_at = created_at
    }
    override public static func primaryKey() -> String? {
        return "id"
    }
}

extension AnnictUserEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
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
