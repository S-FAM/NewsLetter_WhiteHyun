//
//  NewsViewController.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/10.
//

import UIKit

class NewsViewController: UIViewController {
  
  
  private lazy var newsTableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()
  
  private var viewModel = NewsListViewModel()
  
  private var headerView: NewsHeaderView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    setupConstraints()
    
    headerView = NewsHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 371))
    newsTableView.tableHeaderView = headerView
    
    viewModel.news.bind { [weak self] _ in
      DispatchQueue.main.async {
        self?.newsTableView.reloadData()
      }
    }
    
    fetchData()
  }
  
  private func setupLayouts() {
    view.addSubview(newsTableView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate(
      [
        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        newsTableView.topAnchor.constraint(equalTo: view.topAnchor),
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ]
    )
  }
  
  private func fetchData() {
    
    APICaller().getNaverNews(header: APINewsURI(query: "IT", display: 20, start: 1)) { results in
      
      switch results {
      case .failure(let error):
        print(error.localizedDescription)
        
      case .success(let result):
        self.viewModel.news.value = result.items.compactMap {
          NewsTableViewCellViewModel(title: $0.title, description: $0.description, image: nil, publishDate: $0.publishDate)
        }
        break
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.news.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: NewsTableViewCell.identifier,
      for: indexPath
    ) as? NewsTableViewCell
    else {
      return UITableViewCell()
    }
    
    cell.configure(with: viewModel.news.value[indexPath.row])
    
    return cell
  }
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 107
  }
}
