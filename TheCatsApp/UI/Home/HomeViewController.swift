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
  var cat: Array<CatResponse>? = nil
  var activityIndicator: UIActivityIndicatorView!
  var emptyMessageLabel: UILabel!
  
  var viewModel: HomeViewModel! = HomeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupContainer()
    setupCatsTableView()
    setupLoader()
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
      self.cat = self.viewModel.catResponse
      
      self.catsTableView = UITableView()
      self.catsTableView.translatesAutoresizingMaskIntoConstraints = false
      self.catsTableView.separatorInset = .zero
      self.catsTableView.separatorStyle = .none
      self.catsTableView.backgroundColor = .clear
      self.catsTableView.delegate = self
      self.catsTableView.dataSource = self
      self.catsTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
      self.tableViewContainer.addSubview(self.catsTableView)
      
      NSLayoutConstraint.activate([
        self.catsTableView.leadingAnchor.constraint(equalTo: self.tableViewContainer.leadingAnchor, constant: 0),
        self.catsTableView.trailingAnchor.constraint(equalTo: self.tableViewContainer.trailingAnchor, constant: 0),
        self.catsTableView.topAnchor.constraint(equalTo: self.tableViewContainer.topAnchor, constant: 0),
        self.catsTableView.bottomAnchor.constraint(equalTo: self.tableViewContainer.bottomAnchor, constant: 0)
      ])
      
      self.activityIndicator.isHidden = true
      self.activityIndicator.stopAnimating()
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
    cell.configurate(model: model)
    cell.selectionStyle = .none
    return cell
  }
}

