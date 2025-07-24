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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.configure(rank: indexPath.row + 1, title: movie.title, date: movie.releaseDate)
        //        cell.contentView.backgroundColor = .black
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
}
