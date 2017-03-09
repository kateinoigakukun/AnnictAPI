//
//  Users.swift
//  Alphannict
//
//  Created by SaitoYuta on 2017/03/09.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import APIKit

final class AnnictUsers: AnnictRequest {
    public typealias Response = AnnictUserListEntity

    public var path: String {
        return "/v1/users"
    }
    public var method: HTTPMethod {
        return .get
    }

    public var queryParameters: [String : Any]? {
        var parameters:[String : String] = [:]
        page.map { parameters["page"] = $0.description }
        per_page.map { parameters["per_page"] = $0.description }
        sort_id.map { parameters["sort_id"] = $0.description }

        return parameters
    }

    var filter_user_id: Int?
    var filter_username: String?

    var page: Int?
    var per_page: Int?
    var sort_id: AnnictSortType?

    public init(
        filter_user_id: Int? = nil,
        filter_username: String? = nil,
        page: Int? = nil,
        per_page: Int? = nil,
        sort_id: AnnictSortType? = nil) {

        self.filter_user_id = filter_user_id
        self.filter_username = filter_username
        self.page = page
        self.per_page = per_page
        self.sort_id = sort_id
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictUserListEntity {
        return try AnnictUserListEntity.decodeValue(object)
    }
}
