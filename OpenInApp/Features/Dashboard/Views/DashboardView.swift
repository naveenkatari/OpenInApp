//
//  DashboardView.swift
//  OpenInApp
//
//  Created by Naveen Katari  on 30/04/24.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @State private var showingTopLinks = true
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    Text("Good morning, Ajay Manva")
                        .font(.title)
                    if let data = viewModel.dashboardData, let chartData = data.data?.getChartData() {
                        LineChartView(data: chartData)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack { //Hardcoded the list of status, should be maintained in view model
                            QuickStatView(stat: "\(viewModel.dashboardData?.todayClicks ?? 0)", label: "Today's clicks", icon: "today_clicks_icon")
                            QuickStatView(stat: viewModel.dashboardData?.topLocation ?? "NA", label: "Top Location", icon: "location_icon")
                            QuickStatView(stat: viewModel.dashboardData?.topSource ?? "NA", label: "Top Source", icon: "source_icon")
                        }
                        .padding()
                    }
                    ViewAnalyticsButton()
                    HStack {
                        Button("Top Links") {
                            withAnimation {
                                showingTopLinks = true
                            }
                        }
                        .modifier(ButtonStyleModifier(isSelected: showingTopLinks))
                        Button("Recent Links") {
                            withAnimation {
                                showingTopLinks = false
                            }
                        }
                        .modifier(ButtonStyleModifier(isSelected: !showingTopLinks))
                    }
                    .padding()
                    if showingTopLinks {
                        ForEach(viewModel.dashboardData?.data?.topLinks ?? [], id: \.urlId) { link in
                            LinkView(link: link)
                        }
                    } else {
                        ForEach(viewModel.dashboardData?.data?.recentLinks ?? [], id: \.urlId) { link in
                            LinkView(link: link)
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Dashboard")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            //Action
                        }) {
                            Image("nav_icon")
                                .imageScale(.large)
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchDashboardData()
                }
            }
            .background(Color(red: 0.9608, green: 0.9608, blue: 0.9608))
            .listStyle(PlainListStyle())
        }
    }
}
