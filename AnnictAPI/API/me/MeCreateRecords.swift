//
//  MeCreateRecords.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public final class AnnictMeCreateRecords: AnnictRequest {

    public typealias Response = AnnictRecordEntity

    public var path: String {
        return "/v1/me/records"
    }
    public var method: HTTPMethod {
        return .post
    }

    public var queryParameters: [String : Any]? {
        var parameters: [String : String] = [:]
        parameters["episode_id"] = episode_id.description
        _ = comment.map { parameters["comment"] = $0 }
        _ = rating.map { parameters["rating"] = $0.description }
        _ = share_twitter.map { parameters["share_twitter"] = $0.description }
        _ = share_facebook.map { parameters["share_facebook"] = $0.description }

        return parameters
    }

    var episode_id: Int
    var comment: String?
    var rating: Float?
    var share_twitter: Bool?
    var share_facebook: Bool?

    public init(
        episode_id: Int,
        comment: String? = nil,
        rating: Float? = nil,
        share_twitter: Bool? = nil,
        share_facebook: Bool? = nil
        ) {
        self.episode_id = episode_id
        self.comment = comment
        self.rating = rating
        self.share_twitter = share_twitter
        self.share_facebook = share_facebook
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AnnictRecordEntity {
        return try AnnictRecordEntity.decodeValue(object)
    }
}
