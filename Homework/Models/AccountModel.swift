//
//  AccountModel.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/27.
//

import Foundation

// MARK: - AccountModel

struct Account: Codable {
    let id, name: String
    let attack, defense: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case attack = "Attack"
        case defense = "Defense"
    }
}

// MARK: - GetTokenModel

struct GetTokenModel: Codable {
    let token: String?
    let code: Int
    let success: Bool
    let message: String

    enum CodingKeys: String, CodingKey {
        case token = "Token"
        case code = "Code"
        case success = "Success"
        case message = "Message"
    }
}

// MARK: - MemberLoginModel

struct MemberLoginModel: Codable {
    let memberToken: String?
    let code: Int?
    let success: Bool?
    let message: String

    enum CodingKeys: String, CodingKey {
        case memberToken = "MemberToken"
        case code = "Code"
        case success = "Success"
        case message = "Message"
    }
}

// MARK: - MemberDataModel

struct MemberDataModel: Codable {
    let member: Member
    let code: Int
    let success: Bool
    let message: String

    enum CodingKeys: String, CodingKey {
        case member = "Member"
        case code = "Code"
        case success = "Success"
        case message = "Message"
    }
}

// MARK: - Member

struct Member: Codable {
    let id: Double
    let account, name, address, phone: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case account = "Account"
        case name = "Name"
        case address = "Address"
        case phone = "Phone"
        case photo = "Photo"
    }
}
