//
//  AnnictChanelEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public final class AnnictChanelEntity {
    var id: String
    var name: String

    required public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension AnnictChanelEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(id: e <| "id", name: e <| "name")
    }
}
