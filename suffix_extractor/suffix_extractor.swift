//
//  suffix_extractor.swift
//  suffix_extractor
//
//  Created by sugarbaron on 17.04.2021.
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
        for secondOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset, to: currentDate)!
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

struct suffix_extractorEntryView : View {
    
    var entry: Provider.Entry
    
    init(entry: Provider.Entry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer().frame(width: 1)
                Text("\(SharedStorage.sourceText)")
                    .frame(width: 300, height: 70)
                    .foregroundColor(.black)
                    .background(Color(red: 0.85, green: 0.8, blue: 0.65))
                    .cornerRadius(5)
                    .padding(10)
                Spacer().frame(width: 1)
            }
            Spacer()
            if let url = SharedStorage.splitRequest {
                Link(destination: url, label: {
                        Text("split")
                            .frame(width: 70, height: 70)
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(5)
                })
            }
            Spacer()
        }
        
    }
}

@main
struct suffix_extractor: Widget {
    let kind: String = "suffix_extractor"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            suffix_extractorEntryView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.25, green: 0.25, blue: 0.25))
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge])
    }
}

struct suffix_extractor_Previews: PreviewProvider {
    static var previews: some View {
        suffix_extractorEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
