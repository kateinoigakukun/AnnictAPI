//
//  Records.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public class AnnictRecords: AnnictRequest {

    public typealias Response = AnnictRecordListEntity

    public var path: String {
        return "v1/records"
    }
    public var method: HTTPMethod {
        return .get
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        _ = fields.map { parameters["fields"] = $0.join(",") }
        _ = filter_ids.map { parameters["filter_ids"] = $0.join(",") }
        _ = filter_episode_id.map { parameters["filter_episode_id"] = $0.description }
        _ = page.map { parameters["page"] = $0.description }
        _ = per_page.map {parameters["per_page"] = $0.description }
        _ = sort_id.map { parameters["sort_id"] = $0.description }
        _ = sort_likes_count.map { parameters["sort_likes_count"] = $0.description }

        return parameters
    }

    public enum FieldType {
        case id
        case comment
        case rating
        case is_modified
        case likes_count
        case comments_count
        case created_at
        case user
        case work
        case episode

        public var description: String {
            return String(describing: self)
        }
    }

    var fields: [FieldType]?
    var filter_ids: [Int]?
    var filter_episode_id: Int?
    var page: Int?
    var per_page: Int?
    var sort_id: AnnictSortType?
    var sort_likes_count: AnnictSortType?

    public init(
        fields: [FieldType]? = nil,
        filter_ids: [Int]? = nil,
        filter_episode_id: Int? = nil,
        page: Int? = nil,
        per_page: Int? = nil,
        sort_id: AnnictSortType? = nil,
        sort_likes_count: AnnictSortType? = nil
        ) {
        self.fields = fields
        self.filter_ids = filter_ids
        self.filter_episode_id = filter_episode_id
        self.page = page
        self.per_page = per_page
        self.sort_id = sort_id
        self.sort_likes_count = sort_likes_count
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictRecordEntity {
        return try AnnictRecordEntity.decodeValue(object)
    }
}
