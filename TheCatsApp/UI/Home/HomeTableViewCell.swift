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
    addSubview(containerView)
    
    breedName = UILabel()
    breedName.font = .systemFont(ofSize: 16)
    breedName.textColor = .black
    breedName.textAlignment = .left
    breedName.translatesAutoresizingMaskIntoConstraints = false
    addSubview(breedName)
    
    origin = UILabel()
    origin.font = .systemFont(ofSize: 16)
    origin.textColor = .black
    origin.textAlignment = .left
    origin.translatesAutoresizingMaskIntoConstraints = false
    addSubview(origin)
    
    intelligence = UILabel()
    intelligence.font = .systemFont(ofSize: 16)
    intelligence.textColor = .black
    intelligence.textAlignment = .right
    intelligence.translatesAutoresizingMaskIntoConstraints = false
    addSubview(intelligence)
    
    catImage = UIImageView()
    addSubview(catImage)

    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
      containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      
      breedName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      breedName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      breedName.topAnchor.constraint(equalTo: topAnchor, constant: 20),

      origin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      origin.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
      
      intelligence.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      intelligence.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
    ])
  }
  
  func configurate(model: Cat?) {
    breedName.text = (model?.breedName)
    origin.text = (model?.origin)
    let intelligenceString: String = String((model?.intelligence)!)
    intelligence.text = (intelligenceString)
  }
}
