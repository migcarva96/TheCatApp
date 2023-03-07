//
//  CatsResponse.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import Foundation

struct CatResponse: Decodable {
  let breedName: String?
  let origin: String?
  let affectionLevel: Int?
  let intelligence: Int?
  let imageUrl: String?

  enum CodingKeys: String, CodingKey {
    case breedName = "name"
    case origin
    case affectionLevel = "affection_level"
    case intelligence
    case imageUrl = "reference_image_id"
  }
}

//struct CatsResponse: Codable {
//  let cats: [Cat] = Array()
//}
//
//struct Cat: Codable {
//  let breedName: String
//  let origin: String
//  let affectionLevel: Int
//  let intelligence: Int
//  let imageUrl: String
//
//  enum CodingKeys: String, CodingKey {
//    case breedName = "name"
//    case origin
//    case affectionLevel = "affection_level"
//    case intelligence
//    case imageUrl = "reference_image_id"
//  }
//}
