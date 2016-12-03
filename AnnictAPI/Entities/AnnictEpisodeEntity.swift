//
//  AnnictEpisodeEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

class AnnictEpisodeEntity {
    var id: String
    var number: Int?
    var sort_number: Int
    var title: String
    var records_count: Int
    var work: AnnictWorkEntity?
    var prev_episode: AnnictEpisodeEntity?
    var next_episode: AnnictEpisodeEntity?

    required init(
        id: String,
        number: Int?,
        sort_number: Int,
        title: String,
        records_count: Int,
        work: AnnictWorkEntity?,
        prev_episode: AnnictEpisodeEntity?,
        next_episode: AnnictEpisodeEntity?
        ) {
        self.id = id
        self.number = number
        self.sort_number = sort_number
        self.title = title
        self.records_count = records_count
        self.work = work
        self.prev_episode = prev_episode
        self.next_episode = next_episode
    }
}

extension AnnictEpisodeEntity: Decodable {
    static func decode(_ e: Extractor) throws -> Self {

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
