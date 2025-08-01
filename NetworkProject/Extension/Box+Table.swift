//
//  Box+Table.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit

extension BoxOfficeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.configure(movie: movie)
        //        cell.contentView.backgroundColor = .black
        return cell
    }
    func configureTableHeight() {
        tableView.rowHeight = 60
//        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .black
    }
   
}
