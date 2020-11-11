//
//  ContentView.swift
//  Project1
//
//  Created by 이윤진 on 2020/11/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmountString: String = ""
    @State private var numberOfPeopleString = ""
    @State private var tipPercentage = TipPercentageChoice.five
    
    // Form, 데이터나 설정을 담는 컨테이너. 보통 이런 테이블뷰 만들 때 사용. 특이점은 최대 10개까지만 포함 가능. 10개 넘어가면 Stack이나 Group 활용하여 묶어서 처리함.
    
    var body: some View {
        NavigationView{
            
                Form {
                    Section(header: Text("Initial check amount")){
                        TextField("Number of Satoshis",text: $checkAmountString).keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Number of People")){
                        TextField("Number of Satoshis",text: $numberOfPeopleString).keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("How much would you like to tip")){
                        Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(TipPercentageChoice.allCases, id: \.self){ percentage in
                            Text("\(percentage.rawValue)%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    if formattedAmountPerPerson != nil && totalCost > 0 {
                        Section(header: HStack{
                            Spacer() // 좌측 여백 생성
                            Text("Your Split")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding(.top, 48.0)
                                .padding(.bottom, 8.0)
                            Spacer() // 우측 여백 생성
                            // 가운데 정렬
                        },
                        footer:
                            Text("Total including tip:")
                                .fontWeight(.bold)
                            + Text(" \(formattedTotalCost) Satoshis")
                        ){
                            Text("\(formattedAmountPerPerson!) Satoshis")
                        }
                    } // 조건에 해당될 때 하단에 섹션이 등장하게 된다
                    
                }  .navigationBarTitle("WeSplit",displayMode: .large)
            }
            // 우리가 보는 일반적인 navigationbar는 .inline으로 설정해주면 된다
        }
    }


extension ContentView {
    
    private var checkAmount: Double { Double(checkAmountString) ?? 0 }
    // 섹션 1에서 입력받는 값
    private var numberOfPeople: Int { Int(numberOfPeopleString) ?? 0 }
    // 섹션 2에서 입력받는 값
    
    private var totalCost: Double {
        checkAmount
            + (checkAmount * (Double(tipPercentage.rawValue) / 100.0))
    }// 섹션 3에서 선택한 tipPercentage value에 따라 totalCost 변수 값 변경, 섹션 4 footer의 값 결정
    
    
    private var amountPerPerson: Double? {
        guard numberOfPeople > 0 else { return nil } //섹션 2에서 입력받는 값 활용
        
        return totalCost / Double(numberOfPeople)
    }
    
    // 섹션 4의 결과값
    private var formattedAmountPerPerson: String? {
        guard let amountPerPerson = amountPerPerson else { return nil }
        
        return Currency.formatter.string(from: amountPerPerson as NSNumber)
    }
    
    // 섹션 4의 footer 값
    private var formattedTotalCost: String {
        Currency.formatter.string(from: totalCost as NSNumber) ?? ""
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
