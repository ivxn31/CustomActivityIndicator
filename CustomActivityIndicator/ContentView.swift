//
/*
 * Capmega Soluciones Informáticas S.A.S de C.V
 * 15/06/21
 * Iván Tecpanecatl
 * ivant@capmega.com
 */


import SwiftUI

struct ContentView: View {
    @State private var fillPoint = 0.0
    @State private var colorIndex = 0
    let duration = 0.8
    var colors:[Color] = [.red,.green,.blue,.yellow]
    
    private var animation:Animation{
        Animation.easeIn(duration: duration).repeatForever(autoreverses: false)
    }
    
    private var timer:Timer{
        Timer.scheduledTimer(withTimeInterval: duration,repeats: true){ _ in
            if colorIndex + 1 >= self.colors.count{
                self.colorIndex = 0
            }else{
                self.colorIndex += 1
            }
        }
    }
    
    var body: some View {
        Ring(fillPoint: fillPoint).stroke(colors[colorIndex],lineWidth: 10).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .onAppear(){
                withAnimation(self.animation){
                    self.fillPoint = 1.0
                    _ = self.timer
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
