////
////  brouillons.swift
////  DocHub
////
////  Created by Hamza Hajjaj on 28/06/2021.
////
//
//import Foundation
//
//// MARK: - CoursDetail
//struct CoursDetail: Codable {
//    let id: Int
//    let name, slug: String
//    let url: String
//    let categories: [String]
//    let documentSet: [DocumentSet]
//    let threadSet: [ThreadSet]
//    let geholURL: String
//    let followersCount: Int
//    let coursDetailDescription: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, slug, url, categories
//        case documentSet = "document_set"
//        case threadSet = "thread_set"
//        case geholURL = "gehol_url"
//        case followersCount = "followers_count"
//        case coursDetailDescription = "description"
//    }
//}
//
//// MARK: - DocumentSet
//struct DocumentSet: Codable {
//    let documentSetDescription, name: String
//    let tags: [Tag]
//    let course: String
//    let date: String
//    let downloads, fileSize: Int
//    let fileType: FileType
//    let hasPerm: Bool
//    let id: Int
//    let isProcessing, isReady, isUnconvertible: Bool
//    let md5: String
//    let pages: Int
//    let state: State
//    let url: String
//    let user: User
//    let userVote, views: Int
//    let votes: Votes
//    let originalURL, pdfURL: String
//    let imported: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case documentSetDescription = "description"
//        case name, tags, course, date, downloads
//        case fileSize = "file_size"
//        case fileType = "file_type"
//        case hasPerm = "has_perm"
//        case id
//        case isProcessing = "is_processing"
//        case isReady = "is_ready"
//        case isUnconvertible = "is_unconvertible"
//        case md5, pages, state, url, user
//        case userVote = "user_vote"
//        case views, votes
//        case originalURL = "original_url"
//        case pdfURL = "pdf_url"
//        case imported
//    }
//}
//
//enum FileType: String, Codable {
//    case doc = ".doc"
//    case docx = ".docx"
//    case jpg = ".jpg"
//    case pdf = ".pdf"
//    case ppt = ".ppt"
//}
//
//enum State: String, Codable {
//    case done = "DONE"
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let id: Int
//    let color, name: String
//}
//
//// MARK: - User
//struct User: Codable {
//    let name, firstName, lastName: String
//    let isRepresentative: Bool
//    let avatar: String
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case isRepresentative = "is_representative"
//        case avatar
//    }
//}
//
//// MARK: - Votes
//struct Votes: Codable {
//    let upvotes, downvotes: Int
//}
//
//// MARK: - ThreadSet
//struct ThreadSet: Codable {
//    let id: Int
//    let name: String
//    let user: User
//    let created, edited: String
//    let course, document, url: String
//}
