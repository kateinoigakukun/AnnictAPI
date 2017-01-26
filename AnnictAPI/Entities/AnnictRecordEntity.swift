//
//  AnnictRecordEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictRecordEntity: Object {
    dynamic var id: Int = 0
    dynamic var comment: String? = nil
    let rating = RealmOptional<Float>()
    dynamic var is_modified: Bool = false
    dynamic var likes_count: Int = 0
    dynamic var comments_count: Int = 0
//    TODO: Date型にする
    dynamic var created_at: String = ""
    dynamic var user: AnnictUserEntity?
    dynamic var work: AnnictWorkEntity?
    dynamic var episode: AnnictEpisodeEntity?

    convenience public init(
        id: Int,
        comment: String?,
        rating: Float?,
        is_modified: Bool,
        likes_count: Int,
        comments_count: Int,
        created_at: String,
        user: AnnictUserEntity,
        work: AnnictWorkEntity,
        episode: AnnictEpisodeEntity
        ) {
        self.init()
        self.id = id
        self.comment = comment
        self.rating.value = rating
        self.is_modified = is_modified
        self.likes_count = likes_count
        self.comments_count = comments_count
        self.created_at = created_at
        self.user = user
        self.work = work
        self.episode = episode
    }
    override public static func primaryKey() -> String? {
        return "id"
    }
}

extension AnnictRecordEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        return try self.init(
            id: e <| "id",
            comment: e <|? "comment",
            rating: e <|? "rating",
            is_modified: e <| "is_modified",
            likes_count: e <| "likes_count",
            comments_count: e <| "comments_count",
            created_at: e <| "created_at",
            user: e <| "user",
            work: e <| "work",
            episode: e <| "episode"
        )
    }
}
