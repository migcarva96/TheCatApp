//
//  Client.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import Foundation

protocol Client {
  func fetch<Request: API, Response: Decodable>(api: Request, completion: @escaping (Result<Response, Error>) -> Void)
}
