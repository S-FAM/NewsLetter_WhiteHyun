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
  
  private var headerView: NewsHeaderView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    setupConstraints()
    
    headerView = NewsHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 371))
    newsTableView.tableHeaderView = headerView
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
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //FIXME: 가져온 뉴스의 개수로 설정해야함
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: NewsTableViewCell.identifier,
      for: indexPath
    ) as? NewsTableViewCell
    else {
      return UITableViewCell()
    }
    
    //FIXME: 테스트코드, 수정해야함
    cell.textLabel?.text = "Hello, World!"
    return cell
  }
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 107
  }
}
