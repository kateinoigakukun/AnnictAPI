//
//  DeleteRecords.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

class AnnictMeDeleteRecords: AnnictRequest {

    typealias Response = Void

    var path: String {
        return "/v1/me/records\(id)"
    }
    var method: HTTPMethod {
        return .delete
    }

    var queryParameters: [String : Any]? {
        return nil
    }

    var id: Int

    init(id: Int) {
        self.id = id
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> () {
        return
    }
}
