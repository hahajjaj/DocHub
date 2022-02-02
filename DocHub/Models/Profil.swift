//
//  Profil.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 18/06/2021.
//

import Foundation

struct Profil: Decodable {
    let id: Int
    let url: String
    let netid, name, firstName, lastName: String
    let email: String
    let isStaff, isRepresentative, isAcademic: Bool
    let avatar: String
    let token: Token
    let followedCourses: [FollowedCourse]

    enum CodingKeys: String, CodingKey {
        case id, url, netid, name
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case isStaff = "is_staff"
        case isRepresentative = "is_representative"
        case isAcademic = "is_academic"
        case avatar, token
        case followedCourses = "followed_courses"
    }
}

// MARK: - FollowedCourse
struct FollowedCourse: Hashable, Decodable {
    let slug, name: String
}

// MARK: - Token
struct Token: Decodable {
    let key, created: String
}


