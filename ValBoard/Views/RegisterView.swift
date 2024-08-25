//
//  RegisterView.swift
//  ValBoard
//
//  Created by Asir Alam on 8/24/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
//            HeaderView(title: "Register", subtitle: "Get started", angle: -15, backgroundColor: Color.yellow)
//                .offset(y: 70)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ValButton(
                    title: "Create Account",
                    background: Color.green
                ) {
                    viewModel.register()
                }
            }
            
            
            
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}

