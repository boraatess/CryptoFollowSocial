//
//  LoginView.swift
//  Stories
//
//  Created by bora on 8.11.2020.
//

import SwiftUI

struct LoginView: View {
    
    @State var isOpen: Bool = false
    @State var user = ""
    @State var pass = ""
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                Image("bitcoin").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 30)
                    .offset(x: 10, y: 30)
                
            }.offset(y: 100)
            .padding(.bottom,200)
            
            VStack{
                Text("CryptoTik").font(.title)
                    .offset(x: 10.0, y: -25)
            }
            
            VStack(spacing: 20){
                
                Text("Hello").font(.title).fontWeight(.bold)
                
                Text("Sign Into Your Account").fontWeight(.bold)
                
                CustomTF(value: self.$user, isemail: true)
                
                CustomTF(value: self.$pass, isemail: false)
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Forget Password ?").foregroundColor(Color.black.opacity(0.5))
                    }
                }
                
                Button(action: {
                    
                    self.isOpen = true
                
                }) {
                    
                    Text("Login")
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .padding(.vertical,25)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .fullScreenCover(isPresented: $isOpen, content: {
                            MainPageView()
                        })
                    
                }.background(Color("Color2"))
                .clipShape(Capsule())
                .fullScreenCover(isPresented: $isOpen, content: {
                    MainPageView()
                })
                
                Text("Or Login Using Social Media").fontWeight(.bold)
                
                SocialMedia()
                
            }.padding()
            .background(Color.white)
            .cornerRadius(5)
            .padding()
            
            HStack{
                
                Text("Don't Have an Account ?")
                
                Button(action: {
                    
                  //  self.isOpen = true
                    
                }) {
                    
                    Text("Register Now").foregroundColor(Color("Color2"))
                }
                
            }.padding(.top)
            
            Spacer(minLength: 0)
            
        }.edgesIgnoringSafeArea(.top)
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    
    }
    
}


struct SocialMedia : View {
    
    var body : some View{
        
        HStack(spacing: 40){
            
            Button(action: {
                
            }) {
                
                Image("fb").renderingMode(.original)
            }
            
            Button(action: {
                
            }) {
                
                Image("twitter").renderingMode(.original)
            }
        }
    }
}

struct CustomTF : View {
    
    @Binding var value : String
    var isemail = false
    var reenter = false
    
    var body : some View{
        
        VStack(spacing: 8){
            
            HStack{
                
                Text(self.isemail ? "Email ID" : self.reenter ? "Re-Enter" : "Password").foregroundColor(Color.black.opacity(0.1))
                
                Spacer()
            }
        
            HStack{
                
                if self.isemail{
                    
                    TextField("", text: self.$value)
                }
                else{
                    
                    SecureField("", text: self.$value)
                }
                
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: self.isemail ? "envelope.fill" : "eye.slash.fill").foregroundColor(Color("Color2"))
                }
            }
            
            Divider()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
