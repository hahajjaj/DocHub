//
//  SearchModel.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 05/02/2022.
//

import Foundation

// MARK: - SearchModelElement
struct SearchModelElement: Codable, Hashable {
    let name, slug: String
    let documentCount: Int
    let rank, similarity: Double

    enum CodingKeys: String, CodingKey {
        case name, slug
        case documentCount = "document_count"
        case rank, similarity
    }
}

typealias SearchModel = [SearchModelElement]
