//
//  LottoResult.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import Foundation

struct LottoResult: Decodable {
    let totSellamnt: Int
    let drwNoDate: String
    let firstWinamnt: Int
    let drwtNo1: Int //drawn No(뽑힌 숫자)
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let firstAccumamnt: Int // 1등 총 당첨금
    let firstPrzwnerCo: Int // 1등 당첨자 수
    let drwNo: Int // 회차 번호
}
