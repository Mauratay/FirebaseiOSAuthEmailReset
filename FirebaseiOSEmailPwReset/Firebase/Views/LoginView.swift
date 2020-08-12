//
//  LoginView.swift
//  FirebaseiOSEmailPwReset
//
//  Created by Francisco Ayala Mendoza on 08/08/20.
//  Copyright © 2020 Francisco Ayala Mendoza. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    enum Action{
        case signUp,resetPW
    }
    @State private var showSheet = false
    @State private var action:Action?
    
    var body: some View {
        SignInWithEmailView(showSheet: $showSheet, action: $action)
            .sheet(isPresented: $showSheet){
                if self.action == .signUp{
                    SignUpView()
                }else{
                    ForgotPasswordView()
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
