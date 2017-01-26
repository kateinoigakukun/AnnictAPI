//
//  AnnictProgramEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictProgramEntity: Object {
    public dynamic var id: Int = 0
//    TODO: Date型にする
    public dynamic var started_at: String = ""
    public dynamic var is_rebroadcast: Bool = false
    public dynamic var channel: AnnictChannelEntity?
    public dynamic var work: AnnictWorkEntity?
    public dynamic var episode: AnnictEpisodeEntity?

    convenience public init(
        id: Int,
        started_at: String,
        is_rebroadcast: Bool,
        channel: AnnictChannelEntity,
        work: AnnictWorkEntity,
        episode: AnnictEpisodeEntity
        ) {
        self.init()
        self.id = id
        self.started_at = started_at
        self.is_rebroadcast = is_rebroadcast
        self.channel = channel
        self.work = work
        self.episode = episode
    }
    override public static func primaryKey() -> String? {
        return "id"
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
