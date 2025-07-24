//
//  BoxOfficeViewControllerViewController.swift
//  NetworkProject
//
//  Created by piri kim on 7/23/25.
//
import UIKit
import SnapKit

class BoxOfficeViewController: UIViewController {
    var movies = MovieInfo.movies.shuffled().prefix(10)
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "20200401"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .white
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 39, width: 300, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(bottomLine) // 하위 레이어 추가
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        tv.backgroundColor = .black
        tv.separatorColor = .black
        tv.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureLayout()
        actions()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureLayout() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func actions() {
        searchButton.addTarget(self, action: #selector(searchClicked), for: .touchUpInside)
    }
    
    @objc private func searchClicked() {
        view.endEditing(true)
        movies = MovieInfo.movies.shuffled().prefix(10)
        tableView.reloadData()
    }
}

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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
