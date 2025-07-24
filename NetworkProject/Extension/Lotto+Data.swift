//
//  Lotto+Data.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit
import Alamofire

extension LottoViewController {
    func updateNumbers(lotto:LottoResult) {
        let drwts = [lotto.drwtNo1, lotto.drwtNo2, lotto.drwtNo3, lotto.drwtNo4, lotto.drwtNo5, lotto.drwtNo6] // 정렬돼서 옴
        let bnusNum = lotto.bnusNo
        
        for (index, label) in numberLabels.enumerated() {
            let number = drwts[index]
            label.text = "\(number)"
            label.backgroundColor = getBallColor(for: number)
        }
        
        bonusLabel.text = "\(bnusNum)"
        bonusLabel.backgroundColor = getBallColor(for: lotto.bnusNo)
        
        
        dateLabel.text = "\(lotto.drwNoDate)"
        
    }
    
    func requestData(num:Int,completeion:@escaping (LottoResult?)->Void){
        let url = "https://dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(num)"
        
        AF.request(url,method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: LottoResult.self) { response in
                switch response.result {
                    
                case .success(let lotto):
                    print(dump(lotto))
                    completeion(lotto)
                case .failure(_):
                    print("실패하셨습니다")
                    completeion(nil)
                }
            }
    }
}
