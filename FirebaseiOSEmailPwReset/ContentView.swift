//
//  ContentView.swift
//  FirebaseiOSEmailPwReset
//
//  Created by Francisco Ayala Mendoza on 08/08/20.
//  Copyright © 2020 Francisco Ayala Mendoza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo:UserInfo
    var body: some View {
        Group{
            
            if userInfo.isUserAuthenticated == .undefined{
                    Text("Loading...")
                }else if userInfo.isUserAuthenticated == .signedOut{
                    LoginView()
                }else{
                    HomeView() 
                }
            }
        .onAppear {
            self.userInfo.configureFirebaseStateDidChange() 
        }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
