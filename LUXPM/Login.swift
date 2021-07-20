//
//  Login.swift
//  LUXPM
//
//  Created by kamlesh kumar on 20/07/21.
//

import SwiftUI

struct Login: View {

	@ObservedObject var viewModel = LoginViewModel()
	@State private var showingAlert = false
    var body: some View {
				VStack{
					
					Image("alph").padding(.top, 40)
					
					Text("로그인")
						.foregroundColor(Color.init(red: 0.039, green: 0.039, blue: 0.039))
						.font(.custom("Roboto", size: 23))
						
					
					VStack(alignment:.leading) {
						Text("Email").foregroundColor(Color.init("textColor"))
							.font(.custom("Merriweather", size: 12))
						HStack{
							Image("email").frame(width: 24, height: 19, alignment: .center)
							TextField("sabahat@gmail.com", text: $viewModel.email)
								.font(.custom("Merriweather", size: 16))
						}
						//Divider().frame(height:5)
						Rectangle()
							.fill(Color.init("textColor"))
							.frame(width: 300, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
						
					}
					.padding(EdgeInsets(.init(top: 40, leading: 15, bottom: 0, trailing: 15)))
					
					
					
					VStack(alignment:.leading){
						Text("비밀번호").foregroundColor(Color.init("textColor"))
							.font(.custom("Merriweather", size: 12))
						HStack{
							Image("lock").frame(width: 19, height: 22, alignment: .center)
							SecureField("Enter password", text: $viewModel.password)
								.font(.custom("Merriweather", size: 16))
						}
						//Divider().frame(height:5)
						Rectangle()
							.fill(Color.init("textColor"))
							.frame(width: 300, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
						
					}.padding()
					
					HStack {
						Spacer()
						Text("비밀번호 찾기")
							.font(.custom("비밀번호 찾기", size: 14))
							.foregroundColor(Color.init("textColor"))
					}.padding()
					
					Spacer()
					
           Button(action: {
						self.showingAlert = true
             }, label: {
						Text("로그인")
							.frame(width: 287, height: 53, alignment: .center)
							.background(Color.init("buttonColor"))
							.foregroundColor(.white)
							.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
						}).alert(isPresented: $showingAlert) {
							Alert(title: Text("Message"), message: Text(viewModel.isloginSuccess()), dismissButton: .default(Text("Ok")))
	           }
					
					HStack {
						Spacer()
						NavigationLink(
							destination: Register(),
							label: {
								Text("계정이 없으신가요?   가입하기")
									.frame(width: 287, height: 53, alignment: .center)
								 .foregroundColor(Color.init("textColor"))
								 .font(.custom("Roboto", size: 14))
							}).padding(.top , -20)
						}
					}.navigationBarHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
