//
//  ActivityModel.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import Foundation

// MARK: - ActivityModel
struct ActivityModel: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [Result]
}

// MARK: - Result
struct Result: Equatable, Hashable, Codable {
    static func == (lhs: Result, rhs: Result) -> Bool {
        let areEqual = lhs.id == rhs.id
            return areEqual
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    let id = UUID()
    let actor: Actor
    let verb: String
    let actionObject: JSONNull?
    let target: Target

    enum CodingKeys: String, CodingKey {
        case actor, verb
        case actionObject = "action_object"
        case target
    }
}

// MARK: - Actor
struct Actor: Codable {
    let name: String
    let firstName: String
    let lastName: String
    let isRepresentative: Bool
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case name
        case firstName = "first_name"
        case lastName = "last_name"
        case isRepresentative = "is_representative"
        case avatar
    }
}


// MARK: - Target
struct Target: Codable {
    let slug, name: String
    let obj_type: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
