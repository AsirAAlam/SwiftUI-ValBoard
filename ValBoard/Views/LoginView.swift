//
//  LoginView.swift
//  ValBoard
//
//  Created by Asir Alam on 8/24/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
            VStack {
                // Header
//                HeaderView(title: "To Do List",
//                           subtitle: "Get things done",
//                           angle: 15,
//                           backgroundColor: Color.pink)
                
                // Login form
                Form {
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ValButton(
                        title: "Log in",
                        background: Color.blue
                    ) {
                        viewModel.login()
                    }
                }
                .offset(y: -80)
                
                // Create account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                
                Spacer()
            }
            .offset(y: 70)
    }
}

#Preview {
    LoginView()
}

