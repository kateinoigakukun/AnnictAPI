//
//  AnnictProgramEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public final class AnnictProgramEntity {
    var id: Int
//    TODO: Date型にする
    var started_at: String
    var is_rebroadcast: Bool
    var channel: AnnictChannelEntity
    var work: AnnictWorkEntity
    var episode: AnnictEpisodeEntity

    required public init(
        id: Int,
        started_at: String,
        is_rebroadcast: Bool,
        channel: AnnictChannelEntity,
        work: AnnictWorkEntity,
        episode: AnnictEpisodeEntity
        ) {
        self.id = id
        self.started_at = started_at
        self.is_rebroadcast = is_rebroadcast
        self.channel = channel
        self.work = work
        self.episode = episode
    }
}

extension AnnictProgramEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            id: e <| "id",
            started_at: e <| "started_at",
            is_rebroadcast: e <| "is_rebroadcast",
            channel: e <| "channel",
            work: e <| "work",
            episode: e <| "episode")
    }
}
