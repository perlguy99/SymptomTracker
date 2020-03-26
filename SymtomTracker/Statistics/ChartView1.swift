//
//  ChartView1.swift
//  SymtomTracker
//
//  Created by Brent Michalski on 3/17/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//
import UIKit
import SwiftUI
import SwiftUICharts

// TODO: - Different View Options
// * Choose a symptom...
// ** Instances ordered by date, different color for each severity
// ** Instances ordered by date, all lumped together
// ** Instances ordered by date, by triggers
// ** Instances ordered by date, by triggers & severity
// ??

extension UIImage {

    func resize(maxWidthHeight: Double)-> UIImage? {

        let actualHeight = Double(size.height)
        let actualWidth = Double(size.width)
        var maxWidth = 0.0
        var maxHeight = 0.0

        if actualWidth > actualHeight {
            maxWidth = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualWidth)
            maxHeight = (actualHeight * per) / 100.0
        }else{
            maxHeight = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualHeight)
            maxWidth = (actualWidth * per) / 100.0
        }

        let hasAlpha = true
        let scale: CGFloat = 0.0

        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: maxHeight), !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: CGSize(width: maxWidth, height: maxHeight)))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }

}



struct ChartView1: View {
    var predicate: String
    var symptomRequest: FetchRequest<Symptom>
    var symptom: FetchedResults<Symptom>{symptomRequest.wrappedValue}
    
    
    let configuration = SunburstConfiguration(nodes: [
        Node(name: "Cough", value: 12.0, backgroundColor: .systemBlue, children: [
            Node(name: "4", showName: true, value: 4.0, backgroundColor: .systemGreen),
            Node(name: "2", showName: true, value: 2.0, backgroundColor: .systemYellow),
            Node(name: "1", showName: true, value: 1.0, backgroundColor: .systemRed),
        ]),
        Node(name: "Headache", value: 3.0, backgroundColor: .systemIndigo, children: [
            Node(name: "6", showName: true, value: 6.0, backgroundColor: .systemGreen),
            Node(name: "4", showName: true, value: 4.0, backgroundColor: .systemYellow),
//            Node(name: "Severe", image: UIImage(named: "severe")?.resize(maxWidthHeight: 15), value: 2.0, backgroundColor: .systemRed),
        ]),
        Node(name: "Itchy Eyes", value: 6.0, backgroundColor: .systemTeal)
//             children: [
//            Node(name: "Low", image: UIImage(named: "low")?.resize(maxWidthHeight: 15), value: 12.0, backgroundColor: .systemGreen),
//            Node(name: "Moderate", image: UIImage(named: "moderate")?.resize(maxWidthHeight: 15), value: 6.0, backgroundColor: .systemYellow),
//            Node(name: "Severe", image: UIImage(named: "severe")?.resize(maxWidthHeight: 15), value: 1.0, backgroundColor: .systemRed),
//        ]),
        ], calculationMode: .parentIndependent(totalValue: 23)
    )

    
//    let configuration = SunburstConfiguration(nodes: [
//        Node(name: "Cough", value: 12.0, backgroundColor: .systemBlue, children: [
//            Node(name: "4", showName: true, image: UIImage(systemName: "checkmark.shield"), value: 4.0, backgroundColor: .systemGreen),
//            Node(name: "2", showName: true, image: UIImage(systemName: "xmark.shield"), value: 2.0, backgroundColor: .systemYellow),
//            Node(name: "1", showName: true, image: UIImage(systemName: "exclamationmark.shield"), value: 1.0, backgroundColor: .systemRed),
//        ]),
//        Node(name: "Headache", value: 3.0, backgroundColor: .systemOrange, children: [
//            Node(name: "6", showName: true, image: UIImage(systemName: "checkmark.shield"), value: 6.0, backgroundColor: .systemGreen),
//            Node(name: "4", showName: true, image: UIImage(systemName: "xmark.shield"), value: 4.0, backgroundColor: .systemYellow),
////            Node(name: "Severe", image: UIImage(named: "severe")?.resize(maxWidthHeight: 15), value: 2.0, backgroundColor: .systemRed),
//        ]),
//        Node(name: "Itchy Eyes", value: 6.0, backgroundColor: .systemPurple)
////             children: [
////            Node(name: "Low", image: UIImage(named: "low")?.resize(maxWidthHeight: 15), value: 12.0, backgroundColor: .systemGreen),
////            Node(name: "Moderate", image: UIImage(named: "moderate")?.resize(maxWidthHeight: 15), value: 6.0, backgroundColor: .systemYellow),
////            Node(name: "Severe", image: UIImage(named: "severe")?.resize(maxWidthHeight: 15), value: 1.0, backgroundColor: .systemRed),
////        ]),
//        ], calculationMode: .parentIndependent(totalValue: 23)
//    )
    
    
//        let configuration = SunburstConfiguration(nodes: [
//            Node(name: "Cough", value: 12.0, backgroundColor: .systemBlue, children: [
//                Node(name: "Low", image: UIImage(named: "low2")?.resize(maxWidthHeight: 15), value: 4.0, backgroundColor: .systemGreen),
//                Node(name: "Moderate", image: UIImage(named: "moderate2")?.resize(maxWidthHeight: 15), value: 2.0, backgroundColor: .systemYellow),
//                Node(name: "Severe", image: UIImage(named: "severe2")?.resize(maxWidthHeight: 15), value: 1.0, backgroundColor: .systemRed),
//            ]),
//            Node(name: "Headache", value: 3.0, backgroundColor: .systemOrange, children: [
//                Node(name: "Low", image: UIImage(named: "low")?.resize(maxWidthHeight: 15), value: 6.0, backgroundColor: .systemGreen),
//                Node(name: "Moderate", image: UIImage(named: "moderate")?.resize(maxWidthHeight: 15), value: 4.0, backgroundColor: .systemYellow),
//    //            Node(name: "Severe", image: UIImage(named: "severe")?.resize(maxWidthHeight: 15), value: 2.0, backgroundColor: .systemRed),
//            ]),
//            Node(name: "Itchy Eyes", value: 6.0, backgroundColor: .systemPurple)
//    //             children: [
//    //            Node(name: "Low", image: UIImage(named: "low")?.resize(maxWidthHeight: 15), value: 12.0, backgroundColor: .systemGreen),
//    //            Node(name: "Moderate", image: UIImage(named: "moderate")?.resize(maxWidthHeight: 15), value: 6.0, backgroundColor: .systemYellow),
//    //            Node(name: "Severe", image: UIImage(named: "severe")?.resize(maxWidthHeight: 15), value: 1.0, backgroundColor: .systemRed),
//    //        ]),
//            ], calculationMode: .parentIndependent(totalValue: 23)
//        )
    
    
    @FetchRequest var symptom2: FetchedResults<Symptom>
    
    init(predicate: String) {
        self.predicate = predicate
        self.symptomRequest = FetchRequest(entity: Symptom.entity(),
                                           sortDescriptors: [],
                                           predicate: NSPredicate(format: "%K == %@", #keyPath(Symptom.name), predicate)
        )
        
        self._symptom2 = self.symptomRequest
    }


//    public static let orange = GradientColor(start: Colors.OrangeStart, end: Colors.OrangeEnd)
//    public static let blue = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
//    public static let green = GradientColor(start: Color(hexString: "0BCDF7"), end: Color(hexString: "A2FEAE"))
//    public static let blu = GradientColor(start: Color(hexString: "0591FF"), end: Color(hexString: "29D9FE"))
//    public static let bluPurpl = GradientColor(start: Color(hexString: "4ABBFB"), end: Color(hexString: "8C00FF"))
//    public static let purple = GradientColor(start: Color(hexString: "741DF4"), end: Color(hexString: "C501B0"))
//    public static let prplPink = GradientColor(start: Color(hexString: "BC05AF"), end: Color(hexString: "FF1378"))
//    public static let prplNeon = GradientColor(start: Color(hexString: "FE019A"), end: Color(hexString: "FE0BF4"))
//    public static let orngPink = GradientColor(start: Color(hexString: "FF8E2D"), end: Color(hexString: "FF4E7A"))
    
    var body: some View {
        VStack {
            Text("Hello")
//            MultiLineChartView(data: [([0,2,5,7,10], GradientColors.prplNeon), ([1,3,7,10,12], GradientColors.prplPink), ([5,8,10,13,17], GradientColors.green)], title: "Stuff")
//            MultiLineChartView(data: [([0,2,5,7,10], GradientColors.prplNeon), ([1,3,7,10,12], GradientColors.prplPink), ([5,8,10,13,17], GradientColors.green)], title: "Stuff")
//            LineView(data: [([0,2,5,7,10], GradientColors.prplNeon), ([1,3,7,10,12], GradientColors.prplPink), ([5,8,10,13,17], GradientColors.green)], title: "Stuff")
//            LineView(data: [0,2,5,7,10], title: "The Title", legend: "The Legend")
//            LineChartView(data: [0,2,5,7,10], title: "The Title", legend: "The Legend")
//            PieChartView(data: [0,2,5,7,15], title: "The Title", legend: "The Legend")
            
            SunburstView(configuration: configuration)
            
        }
        .onAppear(perform: printStuff)
    }
    
    
    func printStuff() {
        
        print("\n")
        print("------------------------")
        print("symptom:")
        print(symptom)
        
        for instance in symptom.first?.instances?.array as! [Instance] {
            print(instance.stringDateTime)
            print(instance.wrappedSeverity)
            print(instance.typedTrigger)
            print("------------------------")
        }
        
        print("------------------------")
        print("\n")
        
    }

    
    
}


struct ChartView1_Previews: PreviewProvider {
    static var previews: some View {
        ChartView1(predicate: "Cough")
    }
}
