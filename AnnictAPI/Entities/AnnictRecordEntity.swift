//
//  AnnictRecordEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public final class AnnictRecordEntity {
    var id: Int
    var comment: String?
    var rating: Float?
    var is_modified: Bool
    var likes_count: Int
    var comments_count: Int
//    TODO: Date型にする
    var created_at: String
    var user: AnnictUserEntity
    var work: AnnictWorkEntity
    var episode: AnnictEpisodeEntity

    required public init(
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
        self.id = id
        self.comment = comment
        self.rating = rating
        self.is_modified = is_modified
        self.likes_count = likes_count
        self.comments_count = comments_count
        self.created_at = created_at
        self.user = user
        self.work = work
        self.episode = episode
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
