//
//  AnnictSessionAdapter.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit

private var dataTaskResponseBufferKey = 1
private var taskAssociatedObjectCompletionHandlerKey = 1

public class AnnictSessionAdapter: URLSessionAdapter {
    public var accessToken: String

    init(accessToken: String, configuration: URLSessionConfiguration) {
        self.accessToken = accessToken
        super.init(configuration: configuration)
        self.urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }

    open override func createTask(with URLRequest: URLRequest, handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> SessionTask {
        var URLRequest = URLRequest
//        URLRequest.addValue("Authorization", forHTTPHeaderField: "Bearer \(self.accessToken)")
        var component = URLComponents(url: URLRequest.url!, resolvingAgainstBaseURL: true)
        var query = URLRequest.url?.queryItem
        query?["access_token"] = accessToken

        component?.percentEncodedQuery = URLEncodedSerialization.string(from: query!)
        URLRequest.url = component?.url
        let task = urlSession.dataTask(with: URLRequest)

        setBuffer(NSMutableData(), forTask: task)
        setHandler(handler, forTask: task)

        task.resume()

        return task
    }

    private func setBuffer(_ buffer: NSMutableData, forTask task: URLSessionTask) {
        objc_setAssociatedObject(task, &dataTaskResponseBufferKey, buffer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    private func buffer(for task: URLSessionTask) -> NSMutableData? {
        return objc_getAssociatedObject(task, &dataTaskResponseBufferKey) as? NSMutableData
    }
    private func setHandler(_ handler: @escaping (Data?, URLResponse?, Error?) -> Void, forTask task: URLSessionTask) {
        objc_setAssociatedObject(task, &taskAssociatedObjectCompletionHandlerKey, handler as Any, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    private func handler(for task: URLSessionTask) -> ((Data?, URLResponse?, Error?) -> Void)? {
        return objc_getAssociatedObject(task, &taskAssociatedObjectCompletionHandlerKey) as? (Data?, URLResponse?, Error?) -> Void
    }

    // MARK: URLSessionTaskDelegate
    open override func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        handler(for: task)?(buffer(for: task) as Data?, task.response, error)
    }

    // MARK: URLSessionDataDelegate
    open override func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer(for: dataTask)?.append(data)
    }
}
