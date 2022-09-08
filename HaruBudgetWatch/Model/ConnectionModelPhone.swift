//
//  ConnectionModelPhone.swift
//  HaruBudgetWatch
//
//  Created by 송시원 on 2022/08/31.
//

import Foundation
import WatchConnectivity

class ConnectionModelPhone : NSObject,  ObservableObject, WCSessionDelegate{
    
    static let shared = ConnectionModelPhone()
    
    var session: WCSession
    
    private init(session: WCSession = .default){
        self.session = session
        super.init()
        
        self.session.delegate = self
        session.activate()
    }
    
    // iOS와 WatchOS의 연결(세션)시도 이후에 실행되는 함수
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    // 상대편에서 보낸 메시지를 받을 때 사용하는 함수. 실질적으로 제일 많이 사용한다.
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let getContents = message["contents"] as? String ?? ""
        let getDateAdded = message["dateAdded"] as? Date ?? Date()
        let getTagName = message["tagName"] as? String ?? ""
        let getAmount = message["amount"] as? Int ?? 0

//        let item = Item(context: context)
//        item.contents = getContents
//        item.dateAdded = getDateAdded
//        item.tagName = getTagName
//        item.amount = Int32(getAmount)
//                
//        do {
//            // 저장
//            try context.save()
//        } catch let err {
//            print(err.localizedDescription)
//        }
    }
    
    // iOS와 WatchOS의 연결이 일시적으로 끊어졌을 때 (워치가 멀리 떨어져서 연결 중지 등의 이유) 실행되는 함수
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    // iOS와 WatchOS의 연결이 끊어졌을 때 (워치와 폰의 명시적 연결 종료) 실행되는 함수
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
