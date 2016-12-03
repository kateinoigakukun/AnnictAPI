//
//  EditRecords.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

class AnnictMeEditRecords: AnnictRequest {

    typealias Response = AnnictRecordEntity

    var path: String {
        return "/v1/me/records\(id)"
    }
    var method: HTTPMethod {
        return .patch
    }

    var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        _ = comment.map { parameters["comment"] = $0 }
        _ = rating.map { parameters["rating"] = $0.description }
        _ = share_twitter.map { parameters["share_twitter"] = $0.description }
        _ = share_facebook.map { parameters["share_facebook"] = $0.description }

        return parameters
    }

    var id: Int
    var comment: String?
    var rating: Float?
    var share_twitter: Bool?
    var share_facebook: Bool?

    init(
        id: Int,
        comment: String? = nil,
        rating: Float? = nil,
        share_twitter: Bool? = nil,
        share_facebook: Bool? = nil
        ) {
        self.id = id
        self.comment = comment
        self.rating = rating
        self.share_twitter = share_twitter
        self.share_facebook = share_facebook
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictRecordEntity {
        return try AnnictRecordEntity.decodeValue(object)
    }
}