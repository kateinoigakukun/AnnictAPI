//
//  AnnictChannelEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public final class AnnictChannelEntity {
    var id: Int
    var name: String

    required public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension AnnictChannelEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(id: e <| "id", name: e <| "name")
    }
}
