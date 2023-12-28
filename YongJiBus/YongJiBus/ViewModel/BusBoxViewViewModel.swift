//
//  BusBoxViewViewModel.swift
//  YongJiBus
//
//  Created by 김도경 on 2023/07/05.
//

import Foundation
import Alamofire

class BusBoxViewViewModel : MyXMLParser , ObservableObject {
    
    @Published var text : String = "정보 없음"
    
    let key = APIKey.key
    
    let stationId = APIKey.stationId
    
    private var routeId = ""
    
    func load(_ route : BusNumber) {
        print("Func Load Clicked")
        
        switch(route){
        case .three :
            routeId = "228000182"
        case .zero :
            routeId = "228000174"
        case .one:
            routeId = "228000177"
        }
        let testUrl = "https://apis.data.go.kr/6410000/busarrivalservice/getBusArrivalItem?serviceKey=\(key)&stationId=\(stationId)&routeId=\(routeId)"
        
        AF.request(testUrl)
            .responseData { (response) in
                switch response.result {
                case .success(let result):
                    let parser = XMLParser(data: result)
                    parser.delegate = self
                    parser.parse()
                    if let time = self.busTime?.response.msgBody.busArrivalItem.predictTime1 {
                        self.text = time
                        self.text.append(" 분 남음")
                    }
                case .failure(let error):
                    print(error.localizedDescription, error)
                }
        }
    }
}



