//
//  AnnictProgramEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

class AnnictProgramEntity {
    var id: String
//    TODO: Date型にする
    var started_at: String
    var is_rebroadcast: Bool
    var chanel: AnnictChanelEntity
    var work: AnnictWorkEntity
    var episode: AnnictEpisodeEntity

    required init(
        id: String,
        started_at: String,
        is_rebroadcast: Bool,
        chanel: AnnictChanelEntity,
        work: AnnictWorkEntity,
        episode: AnnictEpisodeEntity
        ) {
        self.id = id
        self.started_at = started_at
        self.is_rebroadcast = is_rebroadcast
        self.chanel = chanel
        self.work = work
        self.episode = episode
    }
}

extension AnnictProgramEntity: Decodable {
    static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            id: e <| "id",
            started_at: e <| "started_at",
            is_rebroadcast: e <| "is_rebroadcast",
            chanel: e <| "chanel",
            work: e <| "work",
            episode: e <| "episode")
    }
}
