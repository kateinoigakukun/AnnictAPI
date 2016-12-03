//
//  MeStatuses.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

class AnnictMeStatuses: AnnictRequest {

    typealias Response = Void

    var path: String {
        return "/v1/me/statuses"
    }
    var method: HTTPMethod {
        return .post
    }

    var queryParameters: [String : Any]? {
        var parameters:[String : String] = [:]
        parameters["work_id"] = work_id.description
        parameters["kind"] = kind.description

        return parameters
    }

    var work_id: Int
    var kind: AnnictStatusKind

    init(work_id: Int, kind: AnnictStatusKind) {
        self.work_id = work_id
        self.kind = kind
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> () {
        return
    }
}
