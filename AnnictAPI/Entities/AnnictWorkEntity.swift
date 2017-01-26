//
//  AnnictWorkEntity.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki
import RealmSwift

public final class AnnictWorkEntity: Object {
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var title_kana: String = ""
    dynamic var media: String = ""
    dynamic var media_text: String = ""
    dynamic var season_name: String = ""
    dynamic var season_name_text: String = ""
//    TODO: Date型にする ====
    dynamic var released_on: String? = nil
    dynamic var released_on_about: String? = nil
//    =====================
    private dynamic var _official_site_url: String? = nil
    lazy var official_site_url: URL? = {
        guard let url_str = self._official_site_url else { return nil }
        return URL(string: url_str)
    }()
    private dynamic var _wikipedia_url: String? = nil
    lazy var wikipedia_url: URL? = {
        guard let url_str = self._wikipedia_url else { return nil }
        return URL(string: url_str)
    }()
    dynamic var twitter_username: String? = nil
    dynamic var twitter_hashtag: String? = nil
    dynamic var episodes_count: Int = 0
    dynamic var watchers_count: Int = 0

    convenience public init(
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
        self.init()
        self.id = id
        self.title = title
        self.title_kana = title_kana
        self.media = media
        self.media_text = media_text
        self.season_name = season_name
        self.season_name_text = season_name_text
        self.released_on = released_on
        self.released_on_about = released_on_about
        self._official_site_url = official_site_url?.absoluteString
        self._wikipedia_url = wikipedia_url?.absoluteString
        self.twitter_username = twitter_username
        self.twitter_hashtag = twitter_hashtag
        self.episodes_count = episodes_count
        self.watchers_count = watchers_count
        
    }

    override public static func primaryKey() -> String? {
        return "id"
    }
}

extension AnnictWorkEntity: Decodable {
    public static func decode(_ e: Extractor) throws -> Self {
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
