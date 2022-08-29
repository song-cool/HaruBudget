//
//  ContentView.swift
//  HaruBudgetWatch
//
//  Created by 송시원 on 2022/06/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    //setup NSUserActivity
    func setupIntentsForSiri() {
        let actionIdentifier = "com.cool-song.HaruBudgetWatch.WriteData"
        let activity = NSUserActivity(activityType: actionIdentifier)
        //행동 이름
        activity.title = "Note Money-trace"
        activity.userInfo = ["speech" : "show notifications"]
//        activity.suggestedInvocationPhrase = "응 북마크 실행해"
// 뭐라 말해야 실행되는지..!
        activity.isEligibleForSearch = true
        if #available(iOS 13.0, *) {
            activity.isEligibleForPrediction = true
            activity.persistentIdentifier = NSUserActivityPersistentIdentifier(actionIdentifier)
        }
//        view.userActivity = activity
        //이건 왜 오류나냐?
        activity.becomeCurrent()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


