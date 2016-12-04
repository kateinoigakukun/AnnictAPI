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
        let url_str = try String.decode(e)
        if url_str.isEmpty {
            throw missingKeyPath(nil)
        }

        guard let encoded_url_str = url_str.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed),
            let url = self.init(string: encoded_url_str) else {
            throw typeMismatch("URL", actual: e.rawValue, keyPath: nil)
        }
        return url
    }
}
