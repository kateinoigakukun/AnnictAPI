//
//  AnnictWorkEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

public final class AnnictWorkEntity {
    var id: Int
    var title: String
    var title_kana: String
    var media: String
    var media_text: String
    var season_name: String
    var season_name_text: String
//    TODO: Date型にする ====
    var released_on: String?
    var released_on_about: String?
//    =====================
    var official_site_url: URL?
    var wikipedia_url: URL?
    var twitter_username: String?
    var twitter_hashtag: String?
    var episodes_count: Int
    var watchers_count: Int

    required public init(
        id: Int,
        title: String,
        title_kana: String,
        media: String,
        media_text: String,
        season_name: String,
        season_name_text: String,
        released_on: String?,
        released_on_about: String?,
        official_site_url: URL?,
        wikipedia_url: URL?,
        twitter_username: String?,
        twitter_hashtag: String?,
        episodes_count: Int,
        watchers_count: Int
        ) {
        self.id = id
        self.title = title
        self.title_kana = title_kana
        self.media = media
        self.media_text = media_text
        self.season_name = season_name
        self.season_name_text = season_name_text
        self.released_on = released_on
        self.released_on_about = released_on_about
        self.official_site_url = official_site_url
        self.wikipedia_url = wikipedia_url
        self.twitter_username = twitter_username
        self.twitter_hashtag = twitter_hashtag
        self.episodes_count = episodes_count
        self.watchers_count = watchers_count
        
    }
}

extension AnnictWorkEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
        print(e)
        return try self.init(
            id: e <| "id",
            title: e <| "title",
            title_kana: e <| "title_kana",
            media: e <| "media",
            media_text: e <| "media_text",
            season_name: e <| "season_name",
            season_name_text: e <| "season_name_text",
            released_on: e <|? "released_on",
            released_on_about: e <|? "released_on_about",
            official_site_url: e <|? "official_site_url",
            wikipedia_url: e <|? "wikipedia_url",
            twitter_username: e <|? "twitter_username",
            twitter_hashtag: e <|? "twitter_hashtag",
            episodes_count: e <| "episodes_count",
            watchers_count: e <| "watchers_count")
    }
}
