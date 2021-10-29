//
//  QuickPostWidget.swift
//  QuickPostWidget
//
//  Created by Lara Cook on 2021/10/29.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct QuickPostWidgetEntryView : View {
    var entry: Provider.Entry
    
    // CHECK THE SIZE OF THE WIDGET
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        
        VStack {
            
            HStack(spacing: 20) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                
                Text("REFRESH")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 18))
                    .padding(.bottom, 1)
            }
            .padding(30)
            
            Text("Upload to REFRESH")
                .foregroundColor(Color("Peach"))
                .font(Font.custom("Lato-Regular", size: 12))
            
            HStack(spacing: 20) {
                
                Link(destination: URL(string: "widget://upload")!, label: {
                    Image(systemName: "square.and.arrow.up.on.square.fill")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("Peach"))
                })
                
                if widgetFamily == .systemMedium || widgetFamily == .systemLarge {
                    Link(destination: URL(string: "widget://profile")!, label: {
                        Image(systemName: "person.crop.circle")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("Peach"))
                    })
                }
            }.padding(30)
            
        }.padding()
        
    }
}

@main
struct QuickPostWidget: Widget {
    let kind: String = "QuickPostWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            QuickPostWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quick Post Widget")
        .description("Quick access to posting on REFRESH")
    }
}

struct QuickPostWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuickPostWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
