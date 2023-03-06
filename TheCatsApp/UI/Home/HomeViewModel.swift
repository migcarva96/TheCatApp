//
//  HomeViewModel.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import Foundation

class HomeViewModel {
  let client: Client
  
  init(client: Client = NetworkClient()) {
    self.client = client
  }
  
  var catsResponse: CatsResponse?
  
  func getCats(completion: @escaping (_ succeeded: Bool) -> ()) {
    
    client.fetch(api: CatAPI.cats) { (result: Result<CatsResponse, Error>) in
      switch result {
      case .success(let response):
        self.catsResponse = response
        completion(true)
      case .failure(let error):
        print("a")
        print(error.localizedDescription)
        completion(false)
      }
    }
  }
}
