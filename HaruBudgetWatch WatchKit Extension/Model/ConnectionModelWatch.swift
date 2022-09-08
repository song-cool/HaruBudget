//
//  ConnectionModelWatch.swift
//  HaruBudgetWatch WatchKit Extension
//
//  Created by 송시원 on 2022/08/31.
//

import Foundation
import WatchConnectivity

class ConnectionModelWatch : NSObject,  ObservableObject, WCSessionDelegate{
    
    static let shared = ConnectionModelWatch()
    
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
        let getMessage = message["message"] as? String ?? ""
    }
}
