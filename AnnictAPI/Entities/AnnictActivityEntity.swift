//
//  AnnictActivityEntity.swift
//  Alphannict
//
//  Created by SaitoYuta on 2017/03/09.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictActivityEntity: Object {
    public dynamic var id: Int = 0
    public dynamic var user: AnnictUserEntity?
    public dynamic var action: String = ""
    public dynamic var created_at: String = ""
    public dynamic var work: AnnictWorkEntity?


    public dynamic var episode: AnnictEpisodeEntity?
    public dynamic var record: AnnictRecordEntity?

    public let multiple_record = List<AnnictMultipleRecord>()

    public dynamic var status_kind: String?


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

    public convenience init(
        id: Int,
        user: AnnictUserEntity,
        action: String,
        created_at: String,
        work: AnnictWorkEntity,
        episode: AnnictEpisodeEntity?,
        record: AnnictRecordEntity?,
        multiple_record: [AnnictMultipleRecord]?,
        status_kind: String?
        ) {
        self.init()
        self.id = id
        self.user = user
        self.action = action
        self.created_at = created_at
        self.work = work

        self.episode = episode
        self.record = record
        multiple_record.map {
            self.multiple_record.append(objectsIn: $0)
        }

        self.status_kind = status_kind

    }

    override public static func primaryKey() -> String? {
        return "id"
    }
}

extension AnnictActivityEntity: Decodable {

    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            id: e <| "id",
            user: e <| "id",
            action: e <| "action",
            created_at: e <| "created_at",
            work: e <| "work",
            episode: e <|? "episode",
            record: e <|? "record",
            multiple_record: e <||? "multiple_record",
            status_kind: e <|? ["status", "kind"]
        )
    }
}
