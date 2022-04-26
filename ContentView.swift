import SwiftUI
import MapKit

struct PNumber: Identifiable {
    var id = UUID()
    let title: String
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

class CallViewModel: ObservableObject {
    @Published var phone: [PNumber] = [
        PNumber(title: "Crisis Text Line (741741)"),
        PNumber(title: "National Suicide Prevention Hotline (800-273-8255)"),
        PNumber(title: "Emergency Services (911)")
    ]
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                Text ("Receive confidential services for yourself or anyone you know struggling with suicidal ideation. You're not alone, everything will be OK.")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .padding()
            }
            .navigationTitle("Welcome to Unwind")
        }
    }
}

struct HelpView: View {
    @StateObject var viewModel = CallViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text ("Call these numbers if you ever need help. Call 911 if your life is in danger.")
                    .fontWeight(.light)
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .padding()
                List {
                    ForEach(viewModel.phone) { call in
                        CallRow(title: call.title)
                        
                    }
                }

            }
            .navigationTitle("Get help now")
        }
    }
}

struct CallRow: View {
    let title: String
    
    var body: some View {
        Label(
            title: { Text(title) },
            icon: { Image(systemName: "phone.fill") }
        )
    }
}
                                          
    struct ResourcesView: View {
        @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.808208, longitude: -122.415802), latitudinalMeters: 5000, longitudinalMeters: 5000)
          
          let annotations = [
              Place(name: "Alabama", coordinate: CLLocationCoordinate2D(latitude: 32.379630, longitude: -86.299330)),
              Place(name: "Alaska", coordinate: CLLocationCoordinate2D(latitude: 61.188020, longitude: -149.886510)),
              Place(name: "Arizona", coordinate: CLLocationCoordinate2D(latitude: 37.807319, longitude: -122.421907)),
              Place(name: "Arizona", coordinate: CLLocationCoordinate2D(latitude: 33.447050, longitude: -112.063120)),
              Place(name: "Arkansas", coordinate: CLLocationCoordinate2D(latitude: 34.750960, longitude: -92.324350)),
              Place(name: "California", coordinate: CLLocationCoordinate2D(latitude: 38.578730, longitude: -121.466786)),
              Place(name: "Colorado", coordinate: CLLocationCoordinate2D(latitude: 39.641470, longitude: -105.039900)),
              Place(name: "Connecticut", coordinate: CLLocationCoordinate2D(latitude: 41.763870, longitude: -72.689650)),
              Place(name: "Delaware", coordinate: CLLocationCoordinate2D(latitude: 39.701260, longitude: -75.574140)),
              Place(name: "Iowa", coordinate: CLLocationCoordinate2D(latitude: 41.590090, longitude: -93.598880)),
              Place(name: "Kansas", coordinate: CLLocationCoordinate2D(latitude: 37.174760, longitude: -94.831860)),
              Place(name: "Kentucky", coordinate: CLLocationCoordinate2D(latitude: 38.196210, longitude: -84.862210)),
              Place(name: "Louisiana", coordinate: CLLocationCoordinate2D(latitude: 30.452940, longitude: -91.186760)),
              Place(name: "Maine", coordinate: CLLocationCoordinate2D(latitude: 44.346780, longitude: -69.799500)),
              Place(name: "Maryland", coordinate: CLLocationCoordinate2D(latitude: 39.266710, longitude: -76.723410)),
              Place(name: "Massachusetts", coordinate: CLLocationCoordinate2D(latitude: 42.362300, longitude: -71.063510)),
              Place(name: "New Jersey", coordinate: CLLocationCoordinate2D(latitude: 40.218190, longitude: -74.765900)),
              Place(name: "New Mexico", coordinate: CLLocationCoordinate2D(latitude: 35.608200, longitude: -106.039730)),
              Place(name: "New York", coordinate: CLLocationCoordinate2D(latitude: 42.648060, longitude: -122.421907)),
              Place(name: "North Carolina", coordinate: CLLocationCoordinate2D(latitude: 37.807319, longitude: -73.773338)),
              Place(name: "North Carolina", coordinate: CLLocationCoordinate2D(latitude: 35.784210, longitude: -78.637350)),
              Place(name: "North Dakota", coordinate: CLLocationCoordinate2D(latitude: 46.824870, longitude: -100.813800)),
              Place(name: "Ohio", coordinate: CLLocationCoordinate2D(latitude: 39.962400, longitude: -82.999800)),
              Place(name: "Oklahoma", coordinate: CLLocationCoordinate2D(latitude: 35.489440, longitude: -97.530540)),
              Place(name: "Texas", coordinate: CLLocationCoordinate2D(latitude: 30.286210, longitude: -97.240600)),
              Place(name: "Utah", coordinate: CLLocationCoordinate2D(latitude: 40.773690, longitude: -111.907340)),
              Place(name: "Vermont", coordinate: CLLocationCoordinate2D(latitude: 44.266070, longitude: -72.586660)),
              Place(name: "Virginia", coordinate: CLLocationCoordinate2D(latitude: 37.539260, longitude: -77.438030)),
              Place(name: "Washington", coordinate: CLLocationCoordinate2D(latitude: 47.043300, longitude: -122.823150)),
              Place(name: "West Virginia", coordinate: CLLocationCoordinate2D(latitude: 38.351040, longitude: -81.632530)),
              Place(name: "Wisconsin", coordinate: CLLocationCoordinate2D(latitude: 43.071680, longitude: -89.381770)),
              Place(name: "DC", coordinate: CLLocationCoordinate2D(latitude: 38.907450, longitude: -77.008530)),
              Place(name: "Florida", coordinate: CLLocationCoordinate2D(latitude: 30.423360, longitude: -84.251480)),
              Place(name: "Georgia", coordinate: CLLocationCoordinate2D(latitude: 33.754170, longitude: -84.390640)),
              Place(name: "Hawaii", coordinate: CLLocationCoordinate2D(latitude: 21.307650, longitude: -157.855770)),
              Place(name: "Idaho", coordinate: CLLocationCoordinate2D(latitude: 43.615710, longitude: -116.194690)),
              Place(name: "Illinois", coordinate: CLLocationCoordinate2D(latitude: 39.779190, longitude: -89.648440)),
              Place(name: "Indiana", coordinate: CLLocationCoordinate2D(latitude: 39.769160, longitude: -86.164925)),
              Place(name: "Michigan", coordinate: CLLocationCoordinate2D(latitude: 42.736710, longitude: -84.556605))
                        ]
          
          var rating: String {
              return String(format: "%.1f",Double.random(in: 1...5))
          }
          
          var body: some View {
              Map(coordinateRegion: $region, annotationItems: annotations) { place in
                  MapAnnotation(coordinate: place.coordinate) {
                      HStack {
                          Image(systemName: "pin.fill")
                              .foregroundColor(.red)
                          Text("Help center")
                              .fixedSize()
                      }.padding(10)
                      .background(Color.white)
                      .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                      .overlay(
                          Image(systemName: "arrowtriangle.left.fill")
                              .rotationEffect(Angle(degrees: 270))
                              .foregroundColor(.white)
                              .offset(y: 10)
                          
                          , alignment: .bottom)
                                                  
                  }
              }
          }
}

struct ContentView: View {
    var body: some View {
        TabView {
                HomeView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
             
                ResourcesView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "questionmark.circle.fill")
                        Text("Help centers")
                    }
             
                HelpView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "phone.bubble.left.fill")
                        Text("Get Help")
                    }
             
            }
    }
}
