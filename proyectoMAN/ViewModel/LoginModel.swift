//
//  LoginModel.swift
//  proyectoMAN
//
//  Created by Israel Antoine Rea Marín on 08/04/22.
//

import SwiftUI

class LoginModel: ObservableObject {
    @Published var email: String = ""
    @Published var pass: String = ""
    
    // MARK: FaceID Properties
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var FaceIDEmail: String = ""
    @AppStorage("use_face_password") var FaceIDPassword: String = ""
    
    // MARK: Login status
    @AppStorage("use_face_id") var loginStatus: Bool = false
    
    //MARK: Login
    
    func loginUser(){
        
        if useFaceID{
            //MARK: Storing for future FaceID Login
            FaceIDEmail = email
            FaceIDPassword = pass
        }
        loginStatus = true
    }
}
