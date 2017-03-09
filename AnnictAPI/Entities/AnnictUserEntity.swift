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
    public dynamic var id: Int = 0
    public dynamic var username: String = ""
    public dynamic var name: String = ""
    public dynamic var description_: String = ""
    public dynamic var _url: String? = nil
    public lazy var url: URL? = {
        guard let url_str = self._url else { return nil }
        return URL(string: url_str)
    }()

    public dynamic var _avatar_url: String? = nil
    public lazy var avatar_url: URL? = {
        guard let url_str = self._avatar_url else { return nil }
        return URL(string: url_str)
    }()

    public dynamic var _background_image_url: String? = nil
    public lazy var background_image_url: URL? = {
        guard let url_str = self._background_image_url else { return nil }
        return URL(string: url_str)
    }()

    public dynamic var records_count: Int = 0
//    TODO: Date型にする
    public dynamic var created_at: String = ""

    convenience public init(
        id: Int,
        username: String,
        name: String,
        description: String,
        url: URL?,
        avatar_url: URL?,
        background_image_url: URL?,
        records_count: Int,
        created_at: String
        ) {
        self.init()
        self.id = id
        self.username = username
        self.name = name
        self.description_ = description
        self._url = url?.absoluteString
        self._avatar_url = avatar_url?.absoluteString
        self._background_image_url = background_image_url?.absoluteString
        self.records_count = records_count
        self.created_at = created_at
    }
    override public static func primaryKey() -> String? {
        return "id"
    }
    override public static func ignoredProperties() -> [String] {
        return ["url", "avatar_url", "background_image_url"]
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
            avatar_url: e <|? "avatar_url",
            background_image_url: e <|? "background_image_url",
            records_count: e <| "records_count",
            created_at: e <| "created_at")
    }
}
