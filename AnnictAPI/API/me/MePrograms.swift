//
//  MePrograms.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public class AnnictMePrograms: AnnictRequest {

    public typealias Response = AnnictProgramEntity

    public var path: String {
        return "/v1/me/programs"
    }
    public var method: HTTPMethod {
        return .get
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        _ = fields.map { parameters["fields"] = $0.join(",") }
        _ = filter_ids.map { parameters["filter_ids"] = $0.join(",") }
        _ = filter_channel_ids.map { parameters["filter_channel_ids"] = $0.description }
        _ = filter_work_ids.map { parameters["filter_work_ids"] = $0.join(",") }
        _ = filter_started_at_gt.map { parameters["filter_started_at_gt"] = $0 }
        _ = filter_started_at_lt.map { parameters["filter_started_at_lt"] = $0 }
        _ = filter_unwatched.map { parameters["filter_unwatched"] = $0.description }
        _ = filter_rebroadcast.map { parameters["filter_rebroadcast"] = $0.description }

        _ = page.map { parameters["page"] = $0.description }
        _ = per_page.map {parameters["per_page"] = $0.description }
        _ = sort_id.map { parameters["sort_id"] = $0.description }
        _ = sort_started_at.map { parameters["sort_started_at"] = $0.description }

        return parameters
    }

    public enum FieldType {
        case id
        case started_at
        case is_rebroadcast
        case channel
        case work
        case episode

        public var description: String {
            return String(describing: self)
        }
    }

    var fields: [FieldType]?
    var filter_ids: [Int]?
    var filter_channel_ids: [Int]?
    var filter_work_ids: [String]?
//    TODO: Date型にする
    var filter_started_at_gt: String?
    var filter_started_at_lt: String?
    var filter_unwatched: Bool?
    var filter_rebroadcast: Bool?
    var page: Int?
    var per_page: Int?
    var sort_id: AnnictSortType?
    var sort_started_at: AnnictSortType?

    public init(
        fields: [FieldType]? = nil,
        filter_ids: [Int]? = nil,
        filter_channel_ids: [Int]? = nil,
        filter_work_ids: [String]? = nil,
        filter_started_at_gt: String? = nil,
        filter_started_at_lt: String? = nil,
        filter_unwatched: Bool? = nil,
        filter_rebroadcast: Bool? = nil,
        page: Int? = nil,
        per_page: Int? = nil,
        sort_id: AnnictSortType? = nil,
        sort_started_at: AnnictSortType? = nil
        ) {
        self.fields = fields
        self.filter_ids = filter_ids
        self.filter_channel_ids = filter_channel_ids
        self.filter_work_ids = filter_work_ids
        self.filter_started_at_gt = filter_started_at_gt
        self.filter_started_at_lt = filter_started_at_lt
        self.filter_unwatched = filter_unwatched
        self.filter_rebroadcast = filter_rebroadcast
        self.page = page
        self.per_page = per_page
        self.sort_id = sort_id
        self.sort_started_at = sort_started_at
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictProgramEntity {
        return try AnnictProgramEntity.decodeValue(object)
    }
}
