//
//  BoxOfficeViewController.swift
//  NetworkProject
//
//  Created by piri kim on 7/23/25.
//
import UIKit
import SnapKit

class BoxOfficeViewController: UIViewController {
    var movies:[DailyBoxOffice] = []
    
    internal let searchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 20)
        
        let placeholderText = "ex.20200401"
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [.foregroundColor: UIColor.gray]
        )

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
        tv.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        return tv
    }()
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    // 클로저 함수 축약문
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureLayout()
        actions()
        configureTableHeight()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

#Preview {
    BoxOfficeViewController()
}
