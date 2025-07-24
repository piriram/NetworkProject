//
//  Box+Action.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit
import Alamofire

extension BoxOfficeViewController {
    internal func actions() {
        searchButton.addTarget(self, action: #selector(searchClicked), for: .touchUpInside)
        searchClicked()
    }
    
    @objc private func searchClicked() {
        view.endEditing(true)
//        movies = MovieInfo.movies.shuffled().prefix(10)
        
        let key = "3755a7f6f7e25a709c2ffdf40f407bbe"
        // TODO: 오늘 날짜로 디폴트값 주기 그리고 ""일때도 처리해주기
        var dateField = searchTextField.text ?? ""
        if dateField.isEmpty{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
            
            
            let day = Calendar.current.date(byAdding:.day,value: -1, to: Date()) // 당일 데이터는 안됨
            dateField = formatter.string(from: day ?? Date())
        }
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(key)&targetDt=\(dateField)#"
        print("url : \(url)")
        AF.request(url)
            .responseDecodable(of: BoxOfficeTotal.self) { response in
                switch response.result {
                case .success(let value):
                    self.movies = value.boxOfficeResult.dailyBoxOfficeList
                    self.tableView.reloadData()
                    dump(value)
                case .failure(_):
                    print("error 발생함")
                    self.showAlert(title: "검색실패", message: "yyyyMMdd 형식에 맞춰주세요.")
                    self.movies = []
                    self.tableView.reloadData()
                }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }

}
