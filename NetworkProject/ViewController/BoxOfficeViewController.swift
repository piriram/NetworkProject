//
//  BoxOfficeViewController.swift
//  NetworkProject
//
//  Created by piri kim on 7/23/25.
//
import UIKit
import SnapKit

class BoxOfficeViewController: UIViewController {
    var movies = MovieInfo.movies.shuffled().prefix(10)
    internal let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "20200401"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .white
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 39, width: 300, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor // bound로 리팩토링 한번 해보기
        textField.layer.addSublayer(bottomLine) // 하위 레이어 추가
        return textField
    }()
    
    internal let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    internal let tableView: UITableView = {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        tv.backgroundColor = .black
        tv.separatorColor = .black
        tv.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        return tv
    }()
    // 클로저 함수 축약문
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureLayout()
        actions()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

#Preview {
    BoxOfficeViewController()
}
