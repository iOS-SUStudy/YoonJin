//
//  Currency.swift
//  Project1
//
//  Created by 이윤진 on 2020/11/12.
//

import Foundation

struct Currency {
    static var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 3 // 소수점 아래 최대 세자리까지
        formatter.currencySymbol = ""
        
        return formatter
    }
}
