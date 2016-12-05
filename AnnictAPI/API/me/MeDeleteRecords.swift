//
//  MeDeleteRecords.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public final class AnnictMeDeleteRecords: AnnictRequest {

    public typealias Response = Void

    public var path: String {
        return "/v1/me/records/\(id)"
    }
    public var method: HTTPMethod {
        return .delete
    }

    public var queryParameters: [String : Any]? {
        return nil
    }

    var id: Int

    public init(id: Int) {
        self.id = id
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> () {
        return
    }
}
