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
    public dynamic var id: Int = 0
    public dynamic var number: String? = nil
    public dynamic var number_text: String? = nil
    public dynamic var sort_number: Int = 0
    public dynamic var title: String? = nil
    public dynamic var records_count: Int = 0
    public dynamic var work: AnnictWorkEntity?
    public dynamic var prev_episode: AnnictEpisodeEntity?
    public dynamic var next_episode: AnnictEpisodeEntity?

    convenience public init(
        id: Int,
        number: String?,
        number_text: String?,
        sort_number: Int,
        title: String?,
        records_count: Int,
        work: AnnictWorkEntity?,
        prev_episode: AnnictEpisodeEntity?,
        next_episode: AnnictEpisodeEntity?
        ) {
        self.init()
        self.id = id
        self.number = number
        self.number_text = number_text
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
          number_text: e <|? "number_text",
          sort_number: e <| "sort_number",
          title: e <|? "title",
          records_count: e <| "records_count",
          work: e <|? "work",
          prev_episode: e <|? "prev_episode",
          next_episode: e <|? "next_episode")
    }
}
