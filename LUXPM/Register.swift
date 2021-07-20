//
//  Register.swift
//  LUXPM
//
//  Created by kamlesh kumar on 20/07/21.
//

import SwiftUI

struct Register: View {

	@ObservedObject var registerViewModel = RegisterViewModel()
	@State var showAlert:Bool = false
	@State var navigateto:Bool = false
    var body: some View {
			ScrollView {
				VStack {
					
					HeadingImage().padding(.top, 60)
					
					FormaUi(registerViewModel: registerViewModel)
					
					InputFields(registerViewModel: registerViewModel)
					TermsCondRadio(titleLbl: "최소 하나의 특수문자", ischeckSel: $registerViewModel.isTermSel)
						.padding(.top, 50)
					
					NavigateValidate(registerViewModel: registerViewModel)
				/*
					// password validation ui Start
					VStack {
						HStack {
							VStack(alignment:.leading) {
								RadioButton(titleLbl: "최소 8자 이상", ischeckSel: $registerViewModel.eightChar)
								.disabled(true)
								RadioButton(titleLbl: "최소 하나의 대문자", ischeckSel: $registerViewModel.oneUppChar)
								.disabled(true)
						}
							Spacer()
							VStack(alignment:.leading) {
								RadioButton(titleLbl: "최소 하나의 숫자", ischeckSel: $registerViewModel.oneNumChar)
									.disabled(true)
								RadioButton(titleLbl: "최소 하나의 특수문자", ischeckSel: $registerViewModel.oneSpclChar)
								.disabled(true)
						}
					}.padding(.leading, 20)
						.padding(.trailing, 20)
				}// password validation ui close
					*/
					//Terms and condition
				
					
					// signUp Ui
					

					
				/*	NavigationLink(destination: Text("singned up")) {
						Text("가입하기")
							.frame(width: 287, height: 53, alignment: .center)
							.background(Color.init("buttonColor"))
							.foregroundColor(.white)
							.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
					}.padding(.top , 10)
					*/
					
					// signUp Ui closed
					
					// Already having account login UI Start
					
					LoginNaviation().padding(.top , 10)
					// Already having account login UI End
			}
			}.navigationBarHidden(true)
	}
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
struct HeadingImage:View {
	var body: some View {
		VStack {
		Image("alph")
		
		Text("회원가입")
			.foregroundColor(Color.init(red: 0.039, green: 0.039, blue: 0.039))
			.font(.custom("Roboto", size: 23))
			.padding(.top, 34)
			
		}
	}
}

struct FieldsView : View {
	
	var fieldtitle:String  = ""
	var placeholder:String = ""
	var secure:Bool = false
	
	@Binding var textFieldtext:String
	var body: some View{
		
		VStack(alignment:.leading) {
			Text(fieldtitle).foregroundColor(Color.init("textColor"))
				.font(.custom("Merriweather", size: 12))
			HStack {
				if secure {
					SecureField(placeholder, text: $textFieldtext)
				}else{
				TextField(placeholder, text: $textFieldtext)
					.font(.custom("Merriweather", size: 16))
				}
			}
			Rectangle().frame(height: 0.5, alignment: .bottom)
					.foregroundColor(Color.init("textColor"))
			
			
		}
	}
}

struct RadioButton: View {
	
	var titleLbl:String = ""
	@Binding var ischeckSel:Bool
	
	var  body: some View {
		HStack {
		Button(action: {self.ischeckSel = true}, label: {
			ZStack{
				
				Circle()
					.frame(width: 16, height: 16)
					.background(self.ischeckSel ? Color.init("buttonColor"):Color.init(red: 0.718, green: 0.718, blue: 0.718))
				 .foregroundColor(.clear)
					.cornerRadius(8)
				
			Image(systemName: "checkmark")
				.resizable()
				.frame(width: 10, height: 8)
				//.background(Color.init("buttonColor"))
				.foregroundColor(.white)
			}
			
		})
			Text(titleLbl)
				.foregroundColor(Color.init("textColor"))
				.font(.custom("Merriweather", size: 11))
		}
	}
		
	
}


struct TermsCondRadio: View {
	
	var titleLbl:String = ""
	@Binding var ischeckSel:Bool
	
	var  body: some View {
		HStack {
		Button(action: {self.ischeckSel = true}, label: {
			ZStack{
				
				Circle()
					.frame(width: 20, height: 20)
					.background(self.ischeckSel ? Color.init("buttonColor"):Color.init(red: 0.718, green: 0.718, blue: 0.718))
				 .foregroundColor(.clear)
					.cornerRadius(5)
				
			Image(systemName: "checkmark")
				.resizable()
				.frame(width: 10, height: 8)
				//.background(Color.init("buttonColor"))
				.foregroundColor(.white)
			}
			
		})
			Text(titleLbl)
				.foregroundColor(Color.init("textColor"))
				.font(.custom("Merriweather", size: 11))
		}
	}
}


struct LoginNaviation : View {
	var  body: some View {
	NavigationLink(destination: Login()){
			Text("이미 계정이 있으신가요?  로그인")
				.frame(width: 287, height: 53, alignment: .center)
			 .foregroundColor(Color.init("textColor"))
			 .font(.custom("Roboto", size: 14))
		}
	}
}

struct InputFields:View {
	
	@ObservedObject var registerViewModel:RegisterViewModel
	var body: some View{
		// password validation ui Start
		VStack {
			HStack {
				VStack(alignment:.leading) {
					RadioButton(titleLbl: "최소 8자 이상", ischeckSel: $registerViewModel.eightChar)
					.disabled(true)
					RadioButton(titleLbl: "최소 하나의 대문자", ischeckSel: $registerViewModel.oneUppChar)
					.disabled(true)
			}
				Spacer()
				VStack(alignment:.leading) {
					RadioButton(titleLbl: "최소 하나의 숫자", ischeckSel: $registerViewModel.oneNumChar)
						.disabled(true)
					RadioButton(titleLbl: "최소 하나의 특수문자", ischeckSel: $registerViewModel.oneSpclChar)
					.disabled(true)
			}
		}.padding(.leading, 20)
			.padding(.trailing, 20)
	}// password validation ui close
	}
	
}

struct NavigateValidate:View {
	@ObservedObject var registerViewModel:RegisterViewModel
	@State var showAlert:Bool = false
	@State var navigateTo:Bool = false
	var body: some View {
		NavigationLink("", destination: Login(), isActive: $navigateTo)
		Button(action: {
			if registerViewModel.isEmpteyField(){
				self.showAlert = true
			}else{
				self.navigateTo = true
			}
		}) {
			Text("가입하기")
				.frame(width: 287, height: 53, alignment: .center)
				.background(Color.init("buttonColor"))
				.foregroundColor(.white)
				.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
		}
		.alert(isPresented: $showAlert) {
			Alert(title: Text("Message"), message: Text(registerViewModel.validateField()), dismissButton:.default(Text("Ok")) )
		}
	}
}


struct FormaUi:View {
	
	@ObservedObject var registerViewModel: RegisterViewModel
	
	var body: some View{
		FieldsView(fieldtitle: "이름", placeholder: "이채민", textFieldtext: $registerViewModel.name)
			.padding()
		
		FieldsView(fieldtitle: "휴대폰 번호", placeholder: "+82 111 1111111", textFieldtext: $registerViewModel.phone).padding(.leading, 10).padding(.trailing,10)
			.padding(.leading, 10)
			.padding(.trailing, 10)
		
		FieldsView(fieldtitle: "생년월일", placeholder: " mm - dd-yyyy", textFieldtext: $registerViewModel.dob)
			.padding()
		
		FieldsView(fieldtitle: "Email", placeholder: "john.doe@alphametics.com", textFieldtext: $registerViewModel.email)
			.padding(.leading, 10)
			.padding(.trailing, 10)
		

		
		FieldsView(fieldtitle: "비밀번호", placeholder: "Enter password", secure: true, textFieldtext: $registerViewModel.pwd).padding()
		FieldsView(fieldtitle: "비밀번호 확인", placeholder: "Re enter password", secure: true, textFieldtext: $registerViewModel.rePwd).padding()
	}
}
