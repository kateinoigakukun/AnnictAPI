//
//  AnnictEpisodeEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictEpisodeEntity: Object {
    dynamic var id: Int = 0
    dynamic var number: String? = nil
    dynamic var sort_number: Int = 0
    dynamic var title: String = ""
    dynamic var records_count: Int = 0
    dynamic var work: AnnictWorkEntity?
    dynamic var prev_episode: AnnictEpisodeEntity?
    dynamic var next_episode: AnnictEpisodeEntity?

    convenience public init(
        id: Int,
        number: String?,
        sort_number: Int,
        title: String,
        records_count: Int,
        work: AnnictWorkEntity?,
        prev_episode: AnnictEpisodeEntity?,
        next_episode: AnnictEpisodeEntity?
        ) {
        self.init()
        self.id = id
        self.number = number
        self.sort_number = sort_number
        self.title = title
        self.records_count = records_count
        self.work = work
        self.prev_episode = prev_episode
        self.next_episode = next_episode
    }
    override public static func primaryKey() -> String? {
        return "id"
    }
}

extension AnnictEpisodeEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {

        return try self.init(
          id: e <| "id",
          number: e <|? "number",
          sort_number: e <| "sort_number",
          title: e <| "title",
          records_count: e <| "records_count",
          work: e <|? "work",
          prev_episode: e <|? "prev_episode",
          next_episode: e <|? "next_episode")
    }
}
