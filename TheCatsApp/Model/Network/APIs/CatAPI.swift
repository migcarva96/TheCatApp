//
//  CatAPI.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import Foundation

enum CatAPI: API {
  case cats
  
  var body: EmptyBody? {
    nil
  }
  
  var requestMethod: String {
    "GET"
  }

  var requestPath: String? {
    nil
  }

  var requestPathParam: String? {
    nil
  }

  var queryItems: [URLQueryItem]? {
    switch self {
    case .cats:
      return [URLQueryItem(name: "api_key", value: "bda53789-d59e-46cd-9bc4-2936630fde39")]
    }
  }
}
