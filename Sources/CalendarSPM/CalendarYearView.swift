//
//  CalendarYearView.swift
//  CalendarSPM
//
//  Created by HUI on 2025/9/17.
//
import SwiftUI

public struct DayStat {
    public let day: Int
    public let recordedCount: Int
    public let durationText: String
    public let efficiency: Int
    
    public init(_ tuple: (Int, Int, String, Int)) {
        self.day = tuple.0
        self.recordedCount = tuple.1
        self.durationText = tuple.2
        self.efficiency = tuple.3
    }
    
    // 工厂方法：传元组数组即可
    public static func fromTuples(_ tuples: [(Int, Int, String, Int)]) -> [DayStat] {
        tuples.map { DayStat($0) }
    }
}

public struct CalendarYearView: View {
    public let year: Int
    public let month: Int
    public let stats: [DayStat]
    public let tagColors: [Color] // 整体三组颜色
    
    public init(year: Int, month: Int, stats: [DayStat], tagColors: [Color] = [Color.blue.opacity(0.7), Color.purple.opacity(0.6), Color.yellow.opacity(0.7)]) {
        self.year = year
        self.month = month
        self.stats = stats
        self.tagColors = tagColors
    }
    
    public var body: some View {
        let totalSpacing: CGFloat = 1 * 6
        let cellWidth = (UIScreen.main.bounds.width - totalSpacing) / 7
        let totalCells = 42
        
        var grid: [DayStat?] = Array(repeating: nil, count: totalCells)
        for stat in stats {
            guard stat.day - 1 < totalCells else { continue }
            grid[stat.day - 1] = stat
        }
        let rows = stride(from: 0, to: grid.count, by: 7).map {
            Array(grid[$0..<Swift.min($0 + 7, grid.count)])
        }
        
        return VStack(spacing: 0) {
            HStack(spacing: 1) {
                ForEach(["日","一","二","三","四","五","六"], id: \.self) { w in
                    Text(w)
                        .font(.headline)
                        .frame(width: cellWidth, height: 50)
                }
            }
            
            VStack(spacing: 4) {
                ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: 1) {
                        ForEach(Array(row.enumerated()), id: \.offset) { _, cell in
                            if let stat = cell {
                                VStack(spacing: 5) {
                                    Text("\(stat.day)")
                                        .font(.subheadline)
                                    
                                    VStack(spacing: 2) {
                                        InfoTag(text: "\(stat.recordedCount)次", color: tagColors[0])
                                        InfoTag(text: stat.durationText, color: tagColors[1])
                                        InfoTag(text: "\(stat.efficiency)%", color: tagColors[2])
                                    }
                                }
                                .frame(width: cellWidth)
                            } else {
                                Color.clear.frame(width: cellWidth, height: 0)
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

