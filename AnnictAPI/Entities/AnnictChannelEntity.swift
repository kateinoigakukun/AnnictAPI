//
//  AnnictChannelEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictChannelEntity: Object {
    dynamic var id: Int = 0
    dynamic var name: String = ""

    convenience public init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    override public static func primaryKey() -> String? {
        return "id"
    }
}

extension AnnictChannelEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(id: e <| "id", name: e <| "name")
    }
}
