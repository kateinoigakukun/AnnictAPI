//
//  URL+Decodable.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/03.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

extension URL: Decodable {
    public static func decode(_ e: Extractor) throws -> URL {
        guard let url = try self.init(string: String.decode(e)) else {
            throw typeMismatch("URL", actual: e.rawValue, keyPath: nil)
        }
        return url
    }
}
