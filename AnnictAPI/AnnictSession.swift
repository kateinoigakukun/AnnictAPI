//
//  AnnictSession.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/11/24.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation

class AnnictSession: NSObject {
    var session: URLSession!

    init(configuration: URLSessionConfiguration) {
        super.init()
        self.session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }

    func createTask(with URLRequest: URLRequest,
                    handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        let task = session.dataTask(with: URLRequest)

        task.resume()

        return task
    }
}

extension AnnictSession: URLSessionDelegate {
    typealias CompletionHandler =  (URLSession.AuthChallengeDisposition, URLCredential?) -> Void

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {

    }

    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {

    }

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping CompletionHandler) {
    }
}
