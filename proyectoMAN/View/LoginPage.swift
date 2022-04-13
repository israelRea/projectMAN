//
//  LoginPage.swift
//  proyectoMAN
//
//  Created by Israel Antoine Rea Marín on 08/04/22.
//

import SwiftUI

struct LoginPage: View {
    
    // MARK: Variables
    
    @StateObject var loginModel: LoginModel = LoginModel()
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: FaceID Properties
    @AppStorage("use_face_id") var useFaceID: Bool = false
    
    var body: some View {
        VStack{
            Circle()
                .trim(from: 0, to: 0.5)
                .fill(colorScheme == .dark ? Color.gray : Color.black)
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: -90))
                .offset(x: -23)
                .padding(.bottom,30)
                .hLeading()
            
            Text("Hey, \nlogin now")
                .font(.largeTitle.bold())
                .foregroundColor(colorScheme == .dark ? Color.gray : Color.black)
                .hLeading()
            
            // MARK: Textfields
            
            TextField("Email", text: $loginModel.email)
                .padding()
                .background{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            loginModel.email == "" ? Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                        )
                }
                .textInputAutocapitalization(.never)
                .padding(.top,20)
            
            SecureField("Password", text: $loginModel.pass)
                .padding()
                .background{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            loginModel.pass == "" ? Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                        )
                }
                .textInputAutocapitalization(.never)
                .padding(.top,15)
            
            // MARK: forgot password
            
            NavigationLink(destination: ForgotPasswordPage(), label: {
                Text("forgot password?")
                    .foregroundColor(.gray)
                    .hLeading()
            })
            
            // MARK: User prompt to use FaceID the nextTime
            
            Group{
                if useFaceID {
                    
                    Button{
                        // MARK: do faceID action
                        loginModel.loginUser()
                        
                    } label: {
                        VStack(alignment: .leading, spacing: 10){
                            Label {
                                Text("Use FaceID to login into previous account")
                            } icon: {
                                Image(systemName: "faceid")
                            }
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                            Text("Note: You can turn it off in settings")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .hLeading()
                    
                }else{
                    Toggle(isOn: $useFaceID){
                        Label {
                            Text("Use FaceID to Login")
                        } icon: {
                            Image(systemName: "faceid")
                        }
                        .font(.body)
                        .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical,20)
            
            
            
            
            // MARK: Buttons
            
            Button{
                Task{
                    loginModel.loginUser()
                }
            } label: {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .hCenter()
                    .background{
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.blue)
                    }
                
            }
            .disabled(loginModel.email == "" || loginModel.pass == "")
            .opacity(loginModel.email == "" || loginModel.pass == "" ? 0.5 : 1)
            .padding(.vertical,35)
            
            NavigationLink(destination: RegisterView(), label: {
                Text("Sing up")
                    .foregroundColor(.gray)
            })
            
        }
        .padding(.horizontal,25)
        .padding(.vertical)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
