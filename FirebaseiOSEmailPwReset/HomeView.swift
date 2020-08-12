 //
//  HomeView.swift
//  FirebaseiOSEmailPwReset
//
//  Created by Francisco Ayala Mendoza on 08/08/20.
//  Copyright © 2020 Francisco Ayala Mendoza. All rights reserved.
//

import SwiftUI
import Firebase
 
struct HomeView: View {
    @EnvironmentObject var userInfo:UserInfo
    var body: some View {
        NavigationView{
            Text("Logged in as \(userInfo.user.name)")
            .navigationBarTitle("Firebase Login")
                .navigationBarItems(trailing: Button("Log Out"){
                    FBAuth.logout { (result) in
                        print("Logged out")
                    }
                })
                .onAppear{
                    guard let uid = Auth.auth().currentUser?.uid else{
                        return
                    }
                    FBFirestore.retrieveFBUser(uid: uid) { (result) in
                        switch result{
                        case .failure(let error):
                            print(error.localizedDescription)
                        case .success(let user):
                            self.userInfo.user = user
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
