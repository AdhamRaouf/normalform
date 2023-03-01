    //
    //  ContentView.swift
    //  Form
    //
    //  Created by Adham Raouf on 14/10/2022.
    //

import SwiftUI

struct ContentView: View {
    @State private var fFame = ""
    @State private var lFame = ""
    @State private var birthdate = Date()
    @State private var tog = false
    @State private var step = 1
    var body: some View {
        NavigationView {
            Form {
                Section( header: Text("Personal Information")){
                    TextField("First name", text: $fFame)
                    TextField("Last name", text: $lFame)
                    DatePicker("birthdate", selection: $birthdate, displayedComponents: .date)
                }
                
                Section( header: Text("actions")){
                    Toggle("Send NewsLetter", isOn: $tog)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of liks", value: $step, in: 1...100)
                    Text("This video has \(step) likes")
                    Link("Terms Of Service", destination: URL(string: "https://www.youtube.com/")!)
                }
                
            }
            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        hideKeyboard()
                    }label : {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("save", action: saveUser)
                }
            }
        }
        .ignoresSafeArea()
        .accentColor(.red)
        
    }
    func saveUser(){
        print("Data Saved")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#if canImport (UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction (#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
