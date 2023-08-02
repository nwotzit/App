//
//  Home.swift
//  App
//
//  Created by tue on 8/2/23.
//

import SwiftUI

struct Home: View {
    @State var currentType: Breath = sampleTypes[0]
    @Namespace var animation
    @State var showBreatheView:Bool = false
    @State var startAnimation: Bool = false
    
    var body: some View {
        ZStack {
            Background()
            Content()
            
        }
    }
    @ViewBuilder
        .opacity(showBreatheView ? 0 : 1)
    func Content()-> some View{
        VStack{
            HStack{
                Text("Breath")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity, alignment: .leading)
            
                    .opacity(showBreatheView ? 0 : 1 )
                Button (action: startBreathing) {
                    
                } label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.ultraThinMaterial)
                        }
                    
                }
                Button(action: startBreathing) {
                    
                    Text(showBreatheView ? "Finish Breathing" : "START")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background {
                            if showBreatheView {
                                
                            }else {
                                RoundedRectangle(cornerRadius: 12, style: .continuous, .fill(.blue.gradient))
                            }
                            
                               
                        }
                }
            }
            .padding()
            
            GeometryReader{proxy in
                let size = proxy.size
                
                VStack {
                    BreatheView(size: size)
                    Text("relax your mind")
                        .font(.title3)
                        .foregroundColor(.white)
                        .opacity(showBreatheView ? 0 : 1 )
            
                            
                }
               
                .frame(width: size.width, height: size.height, alignment: .bottom)
                
            }
            }
        
        .frame(maxHeight: .infinity, alignment: .top)
        }
        @ViewBuilder
    func BreatheView (size: CGSize) -> some View {
        ZStack{
            
            ForEach(1...8, id: \.self){index in
               Circle()
                    .fill(.blue.gradient.opacity(0.5))
                    .frame(width: 150, height: 150)
                    .offset(x:75)
                    .rotationEffect(.init(degrees: Double(index * 45)))
                
            }
        }
        .padding()
    }
        
    }
    @ViewBuilder
func Background()-> some View {
    Image("BG")
        .resizable(resizingMode: .stretch)
        .ignoresSafeArea()
}
        func startBreathing(){
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                showBreatheView = true
            }
            
        }
    
    


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
