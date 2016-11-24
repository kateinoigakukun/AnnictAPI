//
//  AnnictRequest.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/11/24.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

enum AnnictRequestMethod {
    case get
    case post
}

protocol AnnictRequest {
    var path: String { get }
    var parameters: [String:Any] { get }
    var method: AnnictRequestMethod { get }
}

extension AnnictRequest {
    var baseURL: String {
        return "https://api.annict.com"
    }
    var requestURL: String {
        return baseURL+path
    }
}
