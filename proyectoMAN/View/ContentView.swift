//
//  ContentView.swift
//  proyectoMAN
//
//  Created by Israel Antoine Rea Marín on 11/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            LoginPage().navigationBarHidden(true)
            HomeView().navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    func hLeading()-> some View{
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    func hCenter()-> some View{
        self.frame(maxWidth: .infinity, alignment: .center)
    }
}
