//
//  AnnictUserListEntity.swift
//  Alphannict
//
//  Created by SaitoYuta on 2017/03/09.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import Himotoki

final class AnnictUserListEntity {
    public var users: [AnnictActivityEntity]
    public var total_count: Int
    public var next_page: Int?
    public var prev_page: Int?

    public required init(
        users: [AnnictActivityEntity],
        total_count: Int,
        next_page: Int?,
        prev_page: Int?
        ) {
        self.users = users
        self.total_count = total_count
        self.next_page = next_page
        self.prev_page = prev_page
    }
}

extension AnnictUserListEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            users: e <|| "users",
            total_count: e <| "total_count",
            next_page: e <|? "next_page",
            prev_page: e <|? "prev_page")
    }
}
