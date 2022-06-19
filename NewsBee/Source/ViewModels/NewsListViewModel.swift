//
//  NewsListViewModel.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/16.
//

struct NewsListViewModel {
  var news: Observable<[NewsTableViewCellViewModel]> = Observable([])
}
