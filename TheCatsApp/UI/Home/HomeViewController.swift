//
//  HomeViewController.swift
//  TheCatsApp
//
//  Created by Miguel Urrea on 6/03/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var titleLabel: UILabel!
  
  var tableViewContainer: UIView!
  var catsTableView: UITableView!
  var cat: Array<Cat>? = nil
  var activityIndicator: UIActivityIndicatorView!
  var emptyMessageLabel: UILabel!
  
  var viewModel: HomeViewModel! = HomeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupContainer()
    setupCatsTableView()
  }
  
  // MARK: Configure UI
  
  func setupContainer() {
    tableViewContainer = UIView()
    tableViewContainer.backgroundColor = .clear
    tableViewContainer.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableViewContainer)
    
    NSLayoutConstraint.activate([
      tableViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
      tableViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
      tableViewContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      tableViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
    ])
  }
  
  func setupCatsTableView() {
    
    viewModel.getCats { succeeded in
      guard succeeded else { return }
      self.cat = self.viewModel.catsResponse?.cats
      
      self.catsTableView = UITableView()
      self.catsTableView.translatesAutoresizingMaskIntoConstraints = false
      self.catsTableView.separatorColor = UIColor(named: "secondaryColor")
      self.catsTableView.separatorInset = .zero
      self.catsTableView.separatorStyle = .none
      self.catsTableView.backgroundColor = .clear
      self.catsTableView.delegate = self
      self.catsTableView.dataSource = self
      self.catsTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "ViewDocumentTableViewCell")
      self.tableViewContainer.addSubview(self.catsTableView)
      
      let containerHeight = Int(self.tableViewContainer.frame.height)
      let tableViewHeight = (self.cat?.count ?? 0) * 44
      let headerHeight = ((containerHeight)/2 - (tableViewHeight)) - 44
      if headerHeight > 0 {
        self.catsTableView.isScrollEnabled = false
        NSLayoutConstraint.activate([
          self.catsTableView.leadingAnchor.constraint(equalTo: self.tableViewContainer.leadingAnchor, constant: 0),
          self.catsTableView.trailingAnchor.constraint(equalTo: self.tableViewContainer.trailingAnchor, constant: 0),
          self.catsTableView.topAnchor.constraint(equalTo: self.tableViewContainer.topAnchor, constant: CGFloat(headerHeight)),
          self.catsTableView.bottomAnchor.constraint(equalTo: self.tableViewContainer.bottomAnchor, constant: 0)
        ])
      } else{
        NSLayoutConstraint.activate([
          self.catsTableView.leadingAnchor.constraint(equalTo: self.tableViewContainer.leadingAnchor, constant: 0),
          self.catsTableView.trailingAnchor.constraint(equalTo: self.tableViewContainer.trailingAnchor, constant: 0),
          self.catsTableView.topAnchor.constraint(equalTo: self.tableViewContainer.topAnchor, constant: 0),
          self.catsTableView.bottomAnchor.constraint(equalTo: self.tableViewContainer.bottomAnchor, constant: 0)
        ])
      }
      self.activityIndicator.isHidden = true
      self.activityIndicator.stopAnimating()
//      let rowCount = self.cat?.count ?? 0
//      if rowCount == 0 {
//        self.emptyMessageLabel.isHidden = false
//      }
    }
  }
  
  func setupLoader() {
    activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.color = UIColor(named: "secondaryColor")
    activityIndicator.startAnimating()
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    NSLayoutConstraint.activate([
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    cat?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
    let model = cat?[indexPath.row]
    cell.selectionStyle = .none
    return cell
  }
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let model = cat?[indexPath.row]
//
//    guard let breedName = model?.breedName else { return }
//    viewModel.viewDocumentById(id: id) { succeeded in
//      guard let imageBase64 = self.viewModel.responseById?[0].file else { return }
//      let imageData = Data(base64Encoded: imageBase64, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
//      let image = UIImage(data: imageData)
//      self.coordinator.imageViewer(image: image)
//
//    }
//  }


}

