//
//  HomeTableViewCell.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
  
  var breedName: UILabel!
  var origin: UILabel!
  var intelligence: UILabel!
  var catImage: UIImageView!
  var containerView: UIView!
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    super.backgroundColor = .clear
    setupCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupCell() {
    containerView = UIView()
    containerView.backgroundColor = .clear
    containerView.layer.borderColor = UIColor.gray.cgColor
    containerView.layer.borderWidth = 1
    containerView.layer.cornerRadius = 10
    containerView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(containerView)
    
    breedName = UILabel()
    breedName.font = .boldSystemFont(ofSize: 16)
    breedName.textColor = .black
    breedName.textAlignment = .left
    breedName.translatesAutoresizingMaskIntoConstraints = false
    addSubview(breedName)
    
    origin = UILabel()
    origin.font = .boldSystemFont(ofSize: 16)
    origin.textColor = .black
    origin.textAlignment = .left
    origin.translatesAutoresizingMaskIntoConstraints = false
    addSubview(origin)
    
    intelligence = UILabel()
    intelligence.font = .boldSystemFont(ofSize: 16)
    intelligence.textColor = .black
    intelligence.textAlignment = .right
    intelligence.translatesAutoresizingMaskIntoConstraints = false
    addSubview(intelligence)
    
    catImage = UIImageView()
    catImage.contentMode = .scaleAspectFit
    catImage.translatesAutoresizingMaskIntoConstraints = false
    addSubview(catImage)
    
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
      
      breedName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      breedName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      breedName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      
      catImage.topAnchor.constraint(equalTo: breedName.bottomAnchor, constant: 10),
      catImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      catImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      catImage.heightAnchor.constraint(equalToConstant: 250),
      
      origin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      origin.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
      origin.topAnchor.constraint(equalTo: catImage.bottomAnchor, constant: 10),
      
      intelligence.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      intelligence.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
      intelligence.topAnchor.constraint(equalTo: catImage.bottomAnchor, constant: 10)
    ])
  }
  
  func configurate(model: CatResponse?) {
    breedName.text = (model?.breedName)
    origin.text = (model?.origin)
    let intelligenceString: String = String((model?.intelligence)!)
    intelligence.text = (intelligenceString)
    if model?.imageUrl != nil {
      let url = "https://cdn2.thecatapi.com/images/" + (model?.imageUrl)! + ".jpg"
      catImage.load(url: URL(string: url)!)
    }
  }
}

extension UIImageView {
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
