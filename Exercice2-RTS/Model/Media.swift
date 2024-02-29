//
//  Media.swift
//  Exercice2-RTS
//
//  Created by Ines BOKRI on 29/02/2024.
//

import Foundation

// MARK: - Media
struct Media: Codable {
    let urn: String
    let title: String
    let duration: TimeInterval
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case urn
        case title
        case duration
    }
}

// MARK: - MediaList
struct MediaListResponse: Codable {
    let mediaList: [Media]
}
