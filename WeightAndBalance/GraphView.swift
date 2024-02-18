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

    // Graph displays center of gravity (CG) in inches on the X axis
    // and weight in pounds on the Y axis. Origin is the lower right corner.
    // This corner is (xOffset, yOffset). Positive X values progress from
    // right to left. Positive Y values progress from botton to top.
    let xRange = 15.0     // In inches.
    let xOffset = 8.5
    let yRange = 1200.0   // In pounds.
    let yOffset = -1000.0
    let xScale: CGFloat?
    let yScale: CGFloat?
    var safeCG: [CGPoint]
    
    init(width: CGFloat, height: CGFloat, components: Components) {
        self.width = width
        self.height = height
        self.xScale = width / xRange
        self.yScale = height / yRange
        self.components = components
        
        // The box defining the safe CG limits. Zero is offset slightly form the
        // bottom.
        self.safeCG = [CGPoint(x: components.minCG, y: components.emptyWeight - 70),
                       CGPoint(x: components.minCG, y: components.maxGrossWeight),
                       CGPoint(x: components.maxCG, y: components.maxGrossWeight),
                       CGPoint(x: components.maxCG, y: components.emptyWeight - 70),
                       CGPoint(x: components.minCG, y: components.emptyWeight - 70)]
    }
    
    var body: some View {
        Canvas { context, size in
            // The safe CG limits:
            context.fill(plotShape(points: safeCG),
                         with: .color(Color(.goodCG)))
            
            // The empty weight base line:
            context.stroke(drawBaseline(), with: .color(.white),
                           style: StrokeStyle(lineWidth: 3))
            
            // Draw a cross at the calculated CG point:
            context.stroke(drawCross(at: CGPoint(x: components!.centerOfGravity, y: components!.totalWeight)), with: .color(Color(red: 0.2, green: 0.0, blue: 0.7)),
                           style: StrokeStyle(lineWidth: 4))
        }
        .frame(width: width, height: height)
        .background(Color(.badCG))
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
    
    // Draw the empty weight baseline.
    func drawBaseline() -> Path {
        var path = Path()
        path.move(to: offsetAndScale(CGPoint(x: components!.minCG - 2.0, y: components!.emptyWeight)))
        path.addLine(to: offsetAndScale(CGPoint(x: components!.maxCG + 2.0, y: components!.emptyWeight)))
        return path
    }
    
    func drawCross(at point: CGPoint) -> Path {
        var path = Path()
        let scaledPoint = offsetAndScale(point)
        
        // Force the cross to be within the bounds of the graph.
        var x = scaledPoint.x < 12 ? 12 : scaledPoint.x
        x = x > (width! - 12) ? width! - 12 : x
        var y = scaledPoint.y < 12 ? 12 : scaledPoint.y
        y = y > (height! - 12) ? height! - 12 : y
        let plottedPoint = CGPoint(x: x, y: y)
        
        path.move(to: CGPoint(x: plottedPoint.x - 12, y: plottedPoint.y))
        path.addLine(to: CGPoint(x: plottedPoint.x + 12, y: plottedPoint.y))
        path.move(to: CGPoint(x: plottedPoint.x, y: plottedPoint.y - 12))
        path.addLine(to: CGPoint(x: plottedPoint.x, y: plottedPoint.y + 12))
        
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
