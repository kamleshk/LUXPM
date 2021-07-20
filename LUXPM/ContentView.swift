//
//  ContentView.swift
//  LUXPM
//
//  Created by kamlesh kumar on 19/07/21.
//

import SwiftUI

struct ContentView: View {
	
    var body: some View {
			NavigationView {
		
				ZStack{
				
				Color.init("background")
			VStack {
				
				Image("alph").padding(.top, 99)
				Image("bar").padding(.top, 87).frame(width:112, height: 70.44)
				
				
				Text("Stay on the top of your finance")
					.padding(.init(top: 49, leading: 5, bottom: 10, trailing: 5))
					.font(.custom("Lato-Regular", size: 20))
					.foregroundColor(Color.init("textColor"))
					
				
				
				Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam" ).padding(.init(top: 49, leading: 0, bottom: 10, trailing: 0))
					.font(.custom("Merriweather-Regular", size: 14))
					.foregroundColor(.gray)
				Spacer()
				
				NavigationLink(destination: Register()) {
					Text("가입하기")
						.frame(width: 287, height: 53, alignment: .center)
						.background(Color.init("buttonColor"))
						.foregroundColor(.white)
						.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
				}.padding(.bottom , 10)
		/*
				Button(action: {
					self.sinUpBtn = true
				}, label: {
					Text("가입하기")
						.frame(width: 287, height: 53, alignment: .center)
						.background(Color.init("buttonColor"))
						.foregroundColor(.white)
						.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
				}).padding(.bottom , 18)
				*/
				
				NavigationLink(
					destination: Login(),
					label: {
						Text("로그인").foregroundColor(Color.init("buttonColor"))
							.font(.custom("Roboto", size: 16))
					}).padding(.bottom, 10)
				
			
			   }
		    }
			  .navigationBarHidden(true)
			 .ignoresSafeArea()
			}
	}
		
	
		
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
