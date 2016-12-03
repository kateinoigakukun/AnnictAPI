//
//  AnnictClient.swift
//  AnnictAPI
//
//  Created by SaitoYuta on 2016/12/01.
//  Copyright © 2016年 kateinoigakukun. All rights reserved.
//

import Foundation
import APIKit
import Result
import SafariServices

private var taskRequestKey = 1
public typealias AnnictClient = Session

public extension AnnictClient {
    public convenience init(accessToken: String) {
        let configuration = URLSessionConfiguration.default
        let adapter = AnnictSessionAdapter(accessToken: accessToken, configuration: configuration)
        self.init(adapter: adapter)

    }

    public var accessToken: String {
        return (adapter as! AnnictSessionAdapter).accessToken
    }
}

public extension AnnictClient {

    public static let AnnictCallbackNotificationName = "AnnictCallbackNotification"
    public static let AnnictAccessTokenKey = "AnnictAccessToken"

    public enum AnnictAuthorizeMethod {
        public typealias AnnictAuthorizeURLHandler = (URL)->Void
        case sfSafariViewController(UIViewController)
        case custom(AnnictAuthorizeURLHandler)
    }

    public typealias AnnictAuthorizeSuccessHandler = (AnnictClient) -> Void
    public typealias AnnictAuthorizeFailureHandler = (AnnictError) -> Void

    public class func authorize(clientId: String,
                                clientSecret: String,
                                callbackURL: String,
                                scope: AnnictOAuthAuthorize.AnnictScope,
                                method: AnnictAuthorizeMethod,
                                success: @escaping AnnictAuthorizeSuccessHandler,
                                failure: @escaping AnnictAuthorizeFailureHandler) {

        createAuthorizeRequest(clientId: clientId, clientSecret: clientSecret,
                               scope: scope, callbackURL: callbackURL,
                               method: method, success: success, failure: failure)
    }

    class func createAuthorizeRequest(clientId: String,
                                      clientSecret: String,
                                      scope: AnnictOAuthAuthorize.AnnictScope,
                                      callbackURL: String,
                                      method: AnnictAuthorizeMethod,
                                      responseType: String = "code",
                                      success: @escaping AnnictAuthorizeSuccessHandler,
                                      failure: @escaping AnnictAuthorizeFailureHandler) {

        let codeRequest = AnnictOAuthAuthorize(client_id: clientId, response_type: responseType,
                                               redirect_uri: callbackURL, scope: scope)

        guard let codeURLRequest = try? codeRequest.buildURLRequest(),
            let codeRequestURL = codeURLRequest.url else {
                failure(AnnictError.parseError)
                return
        }

        switch method {
        case .sfSafariViewController(let viewController):
            AnnictNotification.on(self, name: AnnictCallbackNotificationName, queue: nil) { (notification) in
                guard let accessTokenRequestCode = notification.userInfo?[AnnictAccessTokenKey] as? String else {
                    failure(.parseError)
                    return
                }

                requestAccessToken(clientId: clientId, clientSecret: clientSecret,
                                   authorizeCode: accessTokenRequestCode,
                                   callbackURL: callbackURL,
                                   viewController: viewController,
                                   success: success, failure: failure)
            }
            DispatchQueue.main.async {
                let sfSafariVC = SFSafariViewController(url: codeRequestURL)
                viewController.present(sfSafariVC, animated: true, completion: nil)
            }

        case .custom(let handler):
            handler(codeRequestURL)
        }
    }

    class func requestAccessToken(clientId: String,
                                  clientSecret: String,
                                  authorizeCode: String,
                                  callbackURL: String,
                                  viewController: UIViewController,
                                  success: @escaping AnnictAuthorizeSuccessHandler,
                                  failure: @escaping AnnictAuthorizeFailureHandler) {

        let tokenRequest = AnnictOAuthToken(client_id: clientId, client_secret: clientSecret,
                                            grant_type: "authorization_code",
                                            redirect_uri: callbackURL, code: authorizeCode)

        AnnictClient.send(tokenRequest) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    viewController.dismiss(animated: true, completion: nil)
                }
                success(AnnictClient(accessToken: response.access_token))
            case .failure(let e):
                switch e {
                case .connectionError(let e):
                    failure(AnnictError.connectionError(e))
                case .requestError(let e):
                    failure(AnnictError.requestError(e))
                case .responseError(let e):
                    failure(AnnictError.responseError(e))
                }
            }

        }
    }

    public class func handle(url: URL) {
        guard let code = url.queryItem["code"] else {
            return
        }
        AnnictNotification.post(AnnictClient.AnnictCallbackNotificationName,
                                userInfo: [AnnictClient.AnnictAccessTokenKey: code])
    }
}
