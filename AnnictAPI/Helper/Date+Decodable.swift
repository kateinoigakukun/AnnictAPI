//
//  Date+Decodable.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import Himotoki

extension Date: Decodable {
    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ e: Extractor) throws -> Date {
        return try Date(timeIntervalSince1970: Double.decode(e))
    }
}
