//
//  RegisterView.swift
//  proyectoMAN
//
//  Created by Israel Antoine Rea Marín on 11/04/22.
//

import SwiftUI
import iPhoneNumberField

struct RegisterView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var Remail: String = ""
    @State var Rpass: String = ""
    @State var Rname: String = ""
    @State var RCpass: String = ""
    @State var RlastName: String = ""
    @State var Rphone = ""
    @State var phoneEditing = false
    
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
            
            Text("SignUp")
                .font(.largeTitle.bold())
                .foregroundColor(colorScheme == .dark ? Color.gray : Color.black)
                .hLeading()
            
            HStack{
                TextField("Name", text: $Rname)
                    .padding()
                    .background{
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                Rname == "" ?   Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                            )
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.top,20)
                
                TextField("Last name", text: $RlastName)
                    .padding()
                    .background{
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                RlastName == "" ?   Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                            )
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.top,20)
            }
            
            // MARK: Textfields
            
            TextField("Email", text: $Remail)
                .padding()
                .background{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            Remail == "" ?   Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                        )
                }
                .textInputAutocapitalization(.never)
                .padding(.top,20)
            
            SecureField("Password", text: $Rpass)
                .padding()
                .background{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            Rpass == "" ?   Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                        )
                }
                .textInputAutocapitalization(.never)
                .padding(.top,15)
            
            SecureField("Re-enter password", text: $RCpass)
                .padding()
                .background{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            RCpass == "" ?   Color(UIColor.systemGray6) : Color(UIColor.systemGray6)
                        )
                    
                    
                }
                .textInputAutocapitalization(.never)
                .padding(.top,15)
            
            iPhoneNumberField(text: $Rphone)
                        .flagHidden(false)
                        .flagSelectable(true)
                        .prefixHidden(false)
                        .clearButtonMode(.whileEditing)
                        .onClear { _ in phoneEditing.toggle() }
                        .onReturn { _ in phoneEditing = true }
                        .font(UIFont(size: 20, weight: .semibold , design: .rounded))
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.top,15)
            
            // MARK: Buttons
            
            Button{
                
            } label: {
                Text("Sign up")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .hCenter()
                    .background{
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.blue)
                    }
                
            }
            .disabled(Remail == "" || Rpass == "" || RCpass == ""  || Rname == ""  || RlastName == ""  || Rphone == "")
            .opacity(Remail == "" || Rpass == "" || RCpass == ""  || Rname == ""  || RlastName == ""  || Rphone == "" ? 0.5 : 1)
            .padding(.vertical,35)
            
        }
        .padding(.horizontal,25)
        .padding(.vertical)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
