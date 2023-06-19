//
//  GraphView.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/16/23.
//

import SwiftUI

struct GraphView: View {
    let components: Components?
    let width: CGFloat?
    let height: CGFloat?

    // Graph origin is the lower right corner. This corner is
    // (xOffset, yOffset). Positive X values progress from right to left.
    // Positive Y values progress from botton to top.
    let xRange = 15.0
    let xOffset = 8.5
    let yRange = 1200.0
    let yOffset = -1000.0
    let xScale: CGFloat?
    let yScale: CGFloat?
    
    let safeCG = [CGPoint(x: 10.5, y: 1000.0),
                  CGPoint(x: 10.5, y: 2000.0),
                  CGPoint(x: 21.5, y: 2000.0),
                  CGPoint(x: 21.5, y: 1000.0),
                  CGPoint(x: 10.5, y: 1000.0)]

    init(width: CGFloat, height: CGFloat, components: Components) {
        self.width = width
        self.height = height
        self.xScale = width / xRange
        self.yScale = height / yRange
        self.components = components
    }
    
    var body: some View {
        Canvas { context, size in
            context.fill(plotShape(points: safeCG),
                         with: .color(Color(red: 0.7, green: 0.9, blue: 0.7)))
            context.stroke(drawCross(at: CGPoint(x: components!.centerOfGravity, y: components!.totalWeight)), with: .color(.black),
                           style: StrokeStyle(lineWidth: 4))
        }
        .frame(width: width, height: height)
        .background(Color(red: 0.9, green: 0.7, blue: 0.7))
    }
    
    // Plot a shape using data coordinates.
    func plotShape(points: [CGPoint]) -> Path {
        var path = Path()
        var first = true
        for point in points {
            let plottedPoint = offsetAndScale(point)
            
            if first {
                path.move(to: plottedPoint)
                first = false
            } else {
                path.addLine(to: plottedPoint)
            }
        }
        return path
    }
    
    func drawCross(at point: CGPoint) -> Path {
        var path = Path()
        let scaledPoint = offsetAndScale(point)
        
        // Force the cross to be within the bounds of the graph.
        var x = scaledPoint.x < 20 ? 20 : scaledPoint.x
        x = x > (width! - 20) ? width! - 20 : x
        var y = scaledPoint.y < 20 ? 20 : scaledPoint.y
        y = y > (height! - 20) ? height! - 20 : y
        let plottedPoint = CGPoint(x: x, y: y)
        
        path.move(to: CGPoint(x: plottedPoint.x - 20, y: plottedPoint.y))
        path.addLine(to: CGPoint(x: plottedPoint.x + 20, y: plottedPoint.y))
        path.move(to: CGPoint(x: plottedPoint.x, y: plottedPoint.y - 20))
        path.addLine(to: CGPoint(x: plottedPoint.x, y: plottedPoint.y + 20))
        
        return path
    }
    
    // Offset and scale data coordinate to canvas coordinate.
    func offsetAndScale(_ point: CGPoint) -> CGPoint {
        // Canvas origin is upper left corner.
        // In the data, origin is lower right corner.
        var scaledPoint = CGPoint(x: xRange - point.x, y: point.y)
        scaledPoint.x += xOffset
        scaledPoint.x *= xScale!
        scaledPoint.y += yOffset
        scaledPoint.y *= yScale!
        scaledPoint.y = height! - scaledPoint.y
        return scaledPoint
    }
}
