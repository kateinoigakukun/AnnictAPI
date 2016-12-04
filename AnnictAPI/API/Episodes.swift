//
//  Episodes.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public class AnnictEpisodes: AnnictRequest {

    public typealias Response = AnnictEpisodeListEntity

    public var path: String {
        return "v1/episodes"
    }
    public var method: HTTPMethod {
        return .get
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        _ = fields.map { parameters["fields"] = $0.join(",") }
        _ = filter_ids.map { parameters["filter_ids"] = $0.join(",") }
        _ = filter_work_id.map { parameters["filter_work_id"] = $0.description }
        _ = filter_title.map { parameters["filter_title"] = $0 }
        _ = page.map { parameters["page"] = $0.description }
        _ = per_page.map {parameters["per_page"] = $0.description }
        _ = sort_id.map { parameters["sort_id"] = $0.description }
        _ = sort_sort_number.map { parameters["sort_sort_number"] = $0.description }

        return parameters
    }

    public enum FieldType {
        case id
        case number
        case sort_number
        case title
        case records_count
        case work
        case prev_episode
        case next_episode

        public var description: String {
            return String(describing: self)
        }
    }

    var fields: [FieldType]?
    var filter_ids: [Int]?
    var filter_work_id: Int?
    var filter_title: String?
    var page: Int?
    var per_page: Int?
    var sort_id: AnnictSortType?
    var sort_sort_number: AnnictSortType?

    init(
        fields: [FieldType]? = nil,
        filter_ids: [Int]? = nil,
        filter_work_id: Int? = nil,
        filter_title: String?,
        page: Int? = nil,
        per_page: Int? = nil,
        sort_id: AnnictSortType? = nil,
        sort_sort_number: AnnictSortType? = nil
        ) {
        self.fields = fields
        self.filter_ids = filter_ids
        self.filter_work_id = filter_work_id
        self.filter_title = filter_title
        self.page = page
        self.per_page = per_page
        self.sort_id = sort_id
        self.sort_sort_number = sort_sort_number
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictEpisodeEntity {
        return try AnnictEpisodeEntity.decodeValue(object)
    }
}
