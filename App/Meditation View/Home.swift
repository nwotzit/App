import SwiftUI

struct Home: View {
    @State var currentType: Breath = sampleTypes[0]
    @Namespace var animation
    @State var showBreatheView: Bool = false
    @State var startAnimation: Bool = false
    @State var timerCount: CGFloat = 0
    @State var breatheAction: String = "Inhale"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            Background()
            Content()
            
            Text(breatheAction)
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.top,50)
                .opacity(showBreatheView ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: breatheAction)
                .animation(.easeInOut(duration: 1), value: showBreatheView)
            
        }
        //TIMER
        .onReceive(Timer.publish(every: 0.01, on: .main, in: .common) .autoconnect()) { _ in
            if showBreatheView {
                if timerCount >= 3.2 {
                    timerCount = 0
                    breatheAction = (breatheAction == "Exhale" ? "Inhale" : "Exhale")
                    withAnimation(.easeInOut(duration: 3) .delay(0.1)) {
                        self.startAnimation.toggle()
                    }
                    
                }else {
                    timerCount += 0.01
                }
                count = 3 - Int(timerCount)
            } else {
                timerCount = 0
            }
        }
        
    } //i think it's this one
    //MAIN
    @ViewBuilder
    
    func Content()-> some View{
        VStack{
            HStack{
                Text("Breath")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                    .opacity(showBreatheView ? 0 : 1 )
                Button (action: startBreathing) {
                    
                }
                Button(action: startBreathing) {
                    
                    Text(showBreatheView ? "Finish Breathing" : "START")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                    //                        .background {
                    //                            if showBreatheView {
                    //                                RoundedRectangle(cornerRadius: 12, style: .continuous, .stroke(.white.opaciy(0.5)))
                    //
                    //                            }else {
                    //                                RoundedRectangle(cornerRadius: 12, style: .continuous, .fill(.blue.gradient))
                    //                            }
                    //
                    //
                    //                        }
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
                    .offset(x: startAnimation ? 0 : 75)
                    .rotationEffect(.init(degrees: Double(index * 45)))
                
                
            }
        }
        .scaleEffect(startAnimation ? 0.8 : 1)
        .overlay(content: {
            Text("\(count == 0 ? 3 : count)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .animation(.easeInOut, value: count)
                .opacity(showBreatheView ? 1 : 0)
        })
        .frame(height: (size.width - 40))
    }
    
}
@ViewBuilder
func Background()-> some View {
    Image("BG")
        .resizable(resizingMode: .stretch)
        .ignoresSafeArea()
}

func startBreathing() {
    print("testing")
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
