//
//  RegisterViewModel.swift
//  LUXPM
//
//  Created by kamlesh kumar on 20/07/21.
//

import Foundation

class RegisterViewModel: ObservableObject {
	
	@Published var name: String = ""
	@Published var phone: String = ""
	@Published var dob:String = ""
	@Published var email: String = ""
	@Published var rePwd: String = ""
	
	@Published var eightChar:Bool = false
	@Published var oneUppChar:Bool = false
	@Published var oneNumChar:Bool = false
	@Published var oneSpclChar:Bool = false
	@Published var isTermSel:Bool = false
	
	
	
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
	
	/// varable tracking email enterd is correct
	var isvalidEmail:Bool{
		get{
			return self.isValidEmail(email: email)
		}
	}
	
	var isPwdContainsNum:Bool {
		get{
			let numberRegEx  = "(.*\\d.*)"
			let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
			let containsNumber = testCase.evaluate(with: pwd)
       return containsNumber
		}
	}
	
	var isPwdContainsUpperCase:Bool {
		get{
			let regx = "(.*[A-Z].*)"
      let  predStr = NSPredicate(format:"SELF MATCHES %@", regx)
				return predStr.evaluate(with: pwd)
		}
	}
	
	var isPwdContainsLowerCase:Bool {
		get{
			let regx = "(.*[a-z].*)"
			let  predStr = NSPredicate(format:"SELF MATCHES %@", regx)
				return predStr.evaluate(with: pwd)
		}
	}
	
	var isPwdContainsSpacelCase:Bool {
		get{
			let regex = try! NSRegularExpression(pattern: "(.*[!@#$&*].*)", options: .caseInsensitive)
				 return regex.firstMatch(in: pwd, options: [], range: NSRange(location: 0, length: pwd.count)) != nil
		}
	}
	 var isPwdContainsEightCharCase:Bool {
		get{
			return pwd.count >= 8
		}
	}
	
	@Published var pwd: String = "" {
		didSet {
			validatePassword()
		}
	}
	
	
	
	func validatePassword()  {
		
		self.oneNumChar = self.isPwdContainsNum
		self.oneUppChar = self.isPwdContainsUpperCase
		self.oneSpclChar = self.isPwdContainsSpacelCase
		self.eightChar = self.isPwdContainsEightCharCase
		
		print("calling")
	}
	

	
	/// check for emtely and valid data
	/// - Returns: bool
	func isEmpteyField() -> Bool {
		if  name.isEmpty{
			return true
		} else if dob.isEmpty {
			return true
		} else if email.isEmpty{
			return true
		} else if pwd.isEmpty {
			return true
		} else if phone.isEmpty{
			return true
		} else if !isValidEmail(email: email) {
			return true
		}else if !isvalidPassword(password: pwd) {
			return true
		}else if !isTermSel{
			return true
		} else if !(rePwd == pwd) {
			return true
		}
		return false
	}
	
	func validateField() -> String {
		if name.isEmpty {
			return "Pleae enter name"
		} else if  dob.isEmpty {
			return "Pleae enter Dob"
		}else if  email.isEmpty {
			return "Pleae enter Email"
		}else if  pwd.isEmpty {
			return "Pleae enter Password"
		}else if  phone.isEmpty {
			return "Pleae enter Phone number"
		}else if !isValidEmail(email: email){
			return "Please enter valid email"
		}else if !isvalidPassword(password: pwd){
			return "Please enter valid password"
		}else if !isTermSel{
			return "Please select terms and condition"
		}else if !(rePwd == pwd) {
			return "Please enter correct pasword in confirmation field"
		}else{
			return ""
		}
	}
	
}
