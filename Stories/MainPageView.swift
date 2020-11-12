//
//  MainPageView.swift
//  Stories
//
//  Created by bora on 10.11.2020.
//

import SwiftUI

struct MainPageView: View {
    
    @State var index = 0
    
    var body: some View {
        
        VStack(spacing: 0){
            
            ZStack{
                
                if self.index == 0{
                    
                    Color.black.opacity(0.05)
                    MainHome()
                }
                else if self.index == 1{
                    
                    Color.yellow
                    SearchPage()
                }
                else if self.index == 2{
                    
                    Color.blue
                    LikesPage()
                }
                else if self.index == 3{
                    
                    Color.red
                    Notifications()
                }
                else{
                    
                    Color.green
                    ProfilePage()
                }
            }
            
            CircleTab(index: self.$index)
            
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}


struct CustomTextField : View {
    
    @Binding var value : String
    var isemail = false
    var reenter = false
    
    var body : some View{
        
        VStack(spacing: 8){
            
            HStack{
                
                if self.isemail{
                    
                    TextField("search for anything", text: self.$value)
                        .clipShape(Capsule())
                        .frame(width: 300, height: 50, alignment: .center)
                        .offset(x: 70, y: 5)
                    
                }
                else{
                    
                    SecureField("", text: self.$value)
                }
                
             
            }
            
            Divider()
        }
    }
}

struct TopCorner: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: 5, height: 5))
        
        return path
    }
}

struct MainHome : View
{
    @State var user = ""
    var buttonColor = Color("Color2")
    
    var body : some View{
        
            VStack{
            Text("")
                .font(.largeTitle)
                .background(Color("Color2"))
                .frame(width: 430, height: 200, alignment: .center)
            
        }
        .background(Color("Color2"))
        .offset(x: 1, y: -363)
        
        VStack{

            CustomTextField(value: self.$user, isemail: true)
                .frame(width: 300, height: 50)
                .background(Color(.white))
                .clipShape(Capsule())
            
        }
        .offset(x: 10.0, y: -320)
        
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
            Text("Current Rates")
            
            TopCorner()
                .trim(from: 0.0, to: 0.5)
                .fill(buttonColor)
                .frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 1, y: 20)
        }
        .offset(x: -100, y: -230)

        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
            Text("Projections")
                .opacity(0.5)
        }
        .offset(x: 110, y: -230)
        
        VStack{
            Image("search1")
                .offset(x: -100, y: -320)
            
        }

    }
    
}

struct SearchPage : View
{
    var body : some View{
        
        Text("SearchPage")
            .font(.largeTitle)

    }
    
}

struct LikesPage : View
{
    var body : some View{
        
        Text("LikesPage")
            .font(.largeTitle)

    }
    
}

struct Notifications : View
{
    var body : some View{
        
        Text("Notifications")
            .font(.largeTitle)

    }
    
}

struct ProfilePage : View
{
    var body : some View{
        
        Text("ProfilePage")
            .font(.largeTitle)

    }
    
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

struct CircleTab : View {
    
    @Binding var index : Int
    
    var body : some View{
        
        
        HStack{
            
            Button(action: {
                
                self.index = 0
                
            }) {
                
                VStack{
                    
                    if self.index != 0{
                        
                        Image("home").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image("home")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color2"))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Home").foregroundColor(Color.black.opacity(0.7))
                    }
                }
                
                
            }
            
            Spacer(minLength: 10)

            Button(action: {
                
                self.index = 1
                
            }) {
                
                VStack{
                    
                    if self.index != 1{
                        
                        Image("search").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image("search")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color2"))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Search").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 10)

            Button(action: {
                
                self.index = 2
                
            }) {
                
                VStack{
                    
                    if self.index != 2{
                        
                        Image("heart").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image("heart")
                            .resizable()
                            .frame(width: 24, height: 22)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color2"))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Likes").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 10)
            
            Button(action: {
                
                self.index = 3
                
            }) {
                
               VStack{
                   
                   if self.index != 3{
                       
                       Image("ring").foregroundColor(Color.black.opacity(0.2))
                   }
                   else{
                       
                       Image("ring")
                           .resizable()
                           .frame(width: 25, height: 23)
                           .foregroundColor(.white)
                           .padding()
                        .background(Color("Color2"))
                           .clipShape(Circle())
                           .offset(y: -20)
                           .padding(.bottom, -20)
                       
                       Text("Notifications").foregroundColor(Color.black.opacity(0.7))
                   }
               }
            }
            
            Spacer(minLength: 10)

            
            Button(action: {
                
                self.index = 4
                
            }) {
                
                VStack{
                    
                    if self.index != 4{
                        
                        Image("person").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image("person")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color2"))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Account").foregroundColor(Color.black.opacity(0.7))
                    }
                }
                
                
            }
            
        }.padding(.vertical,-10)
        .padding(.horizontal, 25)
        .background(Color.white)
        .animation(.spring())
    }
}
