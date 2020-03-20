//
//  ChartView1.swift
//  SymtomTracker
//
//  Created by Brent Michalski on 3/17/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import SwiftUICharts

// TODO: - Different View Options
// * Choose a symptom...
// ** Instances ordered by date, different color for each severity
// ** Instances ordered by date, all lumped together
// ** Instances ordered by date, by triggers
// ** Instances ordered by date, by triggers & severity
// ??

struct ChartView1: View {
    var body: some View {
        VStack {
            Text("Hello")
            MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Title")
        }
    }
}

struct ChartView1_Previews: PreviewProvider {
    static var previews: some View {
        ChartView1()
    }
}
