//
//  AnnictActivityListEntity.swift
//  Alphannict
//
//  Created by SaitoYuta on 2017/03/09.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

final public class AnnictActivityListEntity {
    public var activities: [AnnictActivityEntity]
    public var total_count: Int
    public var next_page: Int?
    public var prev_page: Int?

    public required init(
        activities: [AnnictActivityEntity],
        total_count: Int,
        next_page: Int?,
        prev_page: Int?
        ) {
        self.activities = activities
        self.total_count = total_count
        self.next_page = next_page
        self.prev_page = prev_page
    }
}

extension AnnictActivityListEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            activities: e <|| "activities",
            total_count: e <| "total_count",
            next_page: e <|? "next_page",
            prev_page: e <|? "prev_page")
    }
}
