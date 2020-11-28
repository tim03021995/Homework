//
//  LoginPageModel.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/28.
//

import Foundation

class LoginPageModel {
    private(set) var token: String = ""
    private(set) var memberToken: String = ""
    let text = "KidTech24930722"

    func getToken(_ compeletion: @escaping (Bool) -> Void) {
        HTTPRequest(method: .POST, host: .webDemo, pathType: .webdemo(endPoint: .GetToken), parameters: makeParameters(secretText: text)).request { [self] (res: Result<GetTokenModel, NetworkError>) in
            switch res {
            case let .success(data):

                if data.success {
                    compeletion(true)
                    token = data.token!
                    print(token)
                } else {
                    compeletion(false)
                    print(data.message)
                }

            case let .failure(error):
                compeletion(false)
                print(error)
            }
        }
    }

    func memberLogin(account: String, password: String, _ compeletion: @escaping (Bool) -> Void) {
        HTTPRequest(method: .POST, host: .webDemo, pathType: .webdemo(endPoint: .MemberLogin), token: token, parameters: makeParameters(account: account, password: password)).request { [self] (res: Result<MemberLoginModel, NetworkError>) in
            switch res {
            case let .success(data):
                if data.success ?? false {
                    self.memberToken = data.memberToken!
                    compeletion(true)
                } else {
                    compeletion(false)
                    print(data.message)
                }

            case let .failure(error):
                compeletion(false)
                print(error)
            }
        }
    }

    func getMemberData(_ compeletion: @escaping (Result<MemberDataModel, NetworkError>) -> Void) {
        HTTPRequest(method: .GET, host: .webDemo, pathType: .webdemo(endPoint: .MemberData), token: memberToken).request { (res: Result<MemberDataModel, NetworkError>) in
            compeletion(res)
        }
    }

    private func makeParameters(secretText: String? = nil, account: String? = nil, password: String? = nil) -> [String: Any] {
        var parameters: [String: Any] = [:]
        if let secretText = secretText {
            parameters["Secret"] = secretText.encryptText()
        }
        if let account = account {
            parameters["Account"] = account
        }
        if let password = password {
            parameters["Password"] = password
        }
        return parameters
    }
}
