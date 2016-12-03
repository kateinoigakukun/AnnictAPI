//
//  MeWorks.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public class AnnictMeWorks: AnnictRequest {

    public typealias Response = AnnictWorkEntity

    public var path: String {
        return "/v1/me/works"
    }
    public var method: HTTPMethod {
        return .get
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        _ = fields.map { parameters["fields"] = $0.join(",") }
        _ = filter_ids.map { parameters["filter_ids"] = $0.join(",") }
        _ = filter_season.map { parameters["filter_season"] = "\($0.year)-\($0.1.description)" }
        _ = filter_title.map { parameters["filter_title"] = $0 }
        _ = filter_status.map { parameters["filter_status"] = $0.description }
        _ = page.map { parameters["page"] = $0.description }
        _ = per_page.map {parameters["per_page"] = $0.description }
        _ = sort_id.map { parameters["sort_id"] = $0.description }
        _ = sort_season.map { parameters["sort_season"] = $0.description }
        _ = sort_watchers_count.map { parameters["sort_watchers_count"] = $0.description }
        return parameters
    }

    public enum FieldType: CustomStringConvertible {
        case id
        case title
        case title_kana
        case media
        case media_text
        case season_name
        case season_name_text
        case released_on
        case released_on_about
        case official_site_url
        case wikipedia_url
        case twitter_username
        case twitter_hashtag
        case episodes_count
        case watchers_count

        public var description: String {
            return String(describing: self)
        }

    }

    var fields: [FieldType]?
    var filter_ids: [Int]?
    var filter_season: (year: Int, AnnictSeasonType)?
    var filter_title: String?
    var filter_status: AnnictStatusKind?
    var page: Int?
    var per_page: Int?
    var sort_id: AnnictSortType?
    var sort_season: AnnictSortType?
    var sort_watchers_count: AnnictSortType?

    public init(
        fields: [FieldType]? = nil,
        filter_ids: [Int]? = nil,
        filter_season: (year: Int, AnnictSeasonType)? = nil,
        filter_title: String? = nil,
        filter_status: AnnictStatusKind? = nil,
        page: Int? = nil,
        per_page: Int? = nil,
        sort_id: AnnictSortType? = nil,
        sort_season: AnnictSortType? = nil,
        sort_watchers_count: AnnictSortType? = nil
        ) {
        self.fields = fields
        self.filter_ids = filter_ids
        self.filter_season = filter_season
        self.filter_title = filter_title
        self.filter_status = filter_status
        self.page = page
        self.per_page = per_page
        self.sort_id = sort_id
        self.sort_season = sort_season
        self.sort_watchers_count = sort_watchers_count
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictWorkEntity {
        return try AnnictWorkEntity.decodeValue(object)
    }
}
