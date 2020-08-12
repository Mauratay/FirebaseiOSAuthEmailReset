//
//  UserInfo.swift
//  FirebaseiOSEmailPwReset
//
//  Created by Francisco Ayala Mendoza on 08/08/20.
//  Copyright © 2020 Francisco Ayala Mendoza. All rights reserved.
//

import Foundation
import FirebaseAuth

class UserInfo:ObservableObject{
    enum FBAuthState{
        case undefined,signedIn,signedOut
    }
   @Published var isUserAuthenticated:FBAuthState = .undefined
    @Published var user: FBUser = .init(uid: "", name: "", email: "")
    
    var authStatDidChangeListenerHandle:AuthStateDidChangeListenerHandle?
    
    func configureFirebaseStateDidChange(){
        authStatDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            guard let _ = user else{
                self.isUserAuthenticated = .signedOut
                return
            }
            self.isUserAuthenticated = .signedIn
//            FBFirestore.retrieveFBUser(uid: user.uid) { (result) in
//                switch result{
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let user):
//                    self.user = user
//                }
//            }
        })
    }
    
}
