//
//  API.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import Foundation

protocol API {
  associatedtype Body: Encodable
  var body: Body? { get }
  var baseURL: String { get }
  var requestMethod: String { get }
  var requestPath: String? { get }
  var requestPathParam: String? { get }
  var queryItems: [URLQueryItem]? { get }
  func asURLRequest() throws -> URLRequest
}

extension API {
  var baseURL: String {
    return "https://api.thecatapi.com/v1/breeds"
  }

  func asURLRequest() throws -> URLRequest {
    var urlRequest: URLRequest!

    guard var urlComponents = URLComponents(string: baseURL)  else {
      throw NetworkError.badURLError
    }

    if let requestPath = requestPath {
      urlComponents.path = requestPath
      if let requestPathParam = requestPathParam {
        urlComponents.path = requestPath + requestPathParam
      }
    }

    urlComponents.queryItems = queryItems
    guard let url = urlComponents.url else {
      throw NetworkError.badURLError
    }

    urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = requestMethod
    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

    if let body = body {
        let bodyData = try JSONEncoder().encode(body)
        urlRequest.httpBody = bodyData
    }

    return urlRequest
  }
}
