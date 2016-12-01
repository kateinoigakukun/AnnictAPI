//
//  AnnictRequest.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

public protocol AnnictRequest: Request {}

extension AnnictRequest {
    public var baseURL: URL {
        return URL(string: "https://api.annict.com")!
    }
}
