//
//  LoginViewModel.swift
//  LUXPM
//
//  Created by kamlesh kumar on 20/07/21.
//

import Foundation

class LoginViewModel : ObservableObject {
	
	@Published var email: String = ""
	@Published var password:String = ""
	
	
	
	let userId = "test@luxpmsoft.com"
	let pass = "test1234!"
	
	
	/// To validate the user input and getting type of failye and succes result
	/// - Returns: string of failure with resion of failure and success
	func isloginSuccess() -> String {
		if !isValidEmail(email: email){
			return "Please provide valid email address"
		} else if !isvalidPassword(password: password){
			return "Please provide at least 8 letters including one uppercase letter, one lowercase letter, one special character, and one number in Password field"
		} else if email == userId && password == pass {
			return "Login successful"
		} else {
			return "Please check email id and password"
		}
	}
	
	
	/// Email validation with rejex
	/// - Parameter email: email input string
	/// - Returns: bool of failure or success
	func isValidEmail(email:String) -> Bool {
					// here, `try!` will always succeed because the pattern is valid
		      let emailPattern = #"^\S+@\S+\.\S+$"#
					let regex = try! NSRegularExpression(pattern: emailPattern, options: .caseInsensitive)
		     return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
			}
	
	/// validatiing password
	/// - Parameter password: input of password string
	/// - Returns: return bool
	func isvalidPassword(password:String) -> Bool {
		let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$", options: .caseInsensitive)
       return regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) != nil
	}
}
