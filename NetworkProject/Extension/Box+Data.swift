//
//  Box+Action.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit

extension BoxOfficeViewController {
    internal func actions() {
        searchButton.addTarget(self, action: #selector(searchClicked), for: .touchUpInside)
    }
    
    @objc private func searchClicked() {
        view.endEditing(true)
        movies = MovieInfo.movies.shuffled().prefix(10)
        tableView.reloadData()
    }
}
