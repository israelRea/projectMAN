//
//  ForgotPasswordPage.swift
//  proyectoMAN
//
//  Created by Israel Antoine Rea Marín on 09/04/22.
//

import SwiftUI

struct ForgotPasswordPage: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var email: String = ""
    
    var body: some View {
        VStack(spacing: 40){
            
            Circle()
                .trim(from: 0, to: 0.5)
                .fill(colorScheme == .dark ? Color.gray : Color.black)
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: -90))
                .offset(x: -23)
                .padding(.bottom,30)
                .hLeading()
            
            Text("Please confirm your email:")
                .foregroundColor(colorScheme == .dark ? Color.gray : Color.black)
                .font(.system(size: 30))
                .hLeading()
            
            TextField("Email", text: $email)
                .padding()
                .background{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            email == "" ?   Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                        )
                }
                .textInputAutocapitalization(.never)
                .padding(.top,20)
                .hLeading()
            
            // MARK: Buttons
            
            Button{
                
            } label: {
                Text("Confirm")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .hCenter()
                    .background{
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.blue)
                    }
                
            }
            .disabled(email == "")
            .opacity(email == "" ? 0.5 : 1)
            .padding(.vertical,35)
        }
        .navigationTitle("Forgot Password")
        .padding(.horizontal,25)
        .padding(.vertical)
    }
}

struct ForgotPasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordPage()
    }
}
