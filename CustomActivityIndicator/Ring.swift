//
/*
 * Capmega Soluciones Informáticas S.A.S de C.V
 * 15/06/21
 * Iván Tecpanecatl
 * ivant@capmega.com
 */


import SwiftUI

struct Ring:Shape {
    var fillPoint = 0.0
    var delayPoint = 0.5
    
    var animatableData:Double{
        get { return fillPoint }
        set { fillPoint = newValue }
    }
    
    func path(in rect:CGRect) -> Path{
        var start = 0.0
        let end = 360 * fillPoint
        
        if fillPoint > delayPoint{
            start = ( 2 * fillPoint) * 360
        }
        
        var path = Path()
        let width = rect.size.width/2
        let height = rect.size.height/2
        path.addArc(center:CGPoint(x:width,y:height),
                    radius: width,
                    startAngle: .degrees(start),
                    endAngle: .degrees(end),
                    clockwise: false)
        return path
    }
}
