//
//  chrisevanspage.swift
//  App
//
//  Created by tue on 8/2/23.
//

import SwiftUI

struct chrisevanspage: View {
    var body: some View {
        VStack{
            Text("Hi")
                .font(.largeTitle)
                .padding()
                .offset(x:-20,y:0)

            HStack{
                Text("Start Date:")
                
            }
            Text("End Date:")
            Text("Your Target")
                .font(.title)
                .padding()
                .offset(x:20,y:30)
            HStack{
                Image(systemName: "arrowshape.forward")
                    .offset(x:250,y:-10)
            
            }
            

        }
        .offset(x:-120,y:-300)
        .padding()
        
        
    }
    
}

struct chrisevanspage_Previews: PreviewProvider {
    static var previews: some View {
        chrisevanspage()
    }
}
