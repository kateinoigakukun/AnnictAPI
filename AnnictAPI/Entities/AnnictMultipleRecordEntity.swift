//
//  AnnictMultipleRecordEntity.swift
//  Alphannict
//
//  Created by SaitoYuta on 2017/03/09.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictMultipleRecord: Object, Decodable {
    dynamic public var record: AnnictRecordEntity?
    dynamic public var episode: AnnictEpisodeEntity?

    public convenience init(
        record: AnnictRecordEntity,
        episode: AnnictEpisodeEntity
        ) {
        self.init()
        self.record = record
        self.episode = episode
    }

    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            record: e <| "record",
            episode: e <| "episode")
    }
}
