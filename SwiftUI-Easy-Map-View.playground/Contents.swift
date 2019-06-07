//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport
import MapKit

struct ContentView : View {
	var body : some View {
		NavigationView {
			MapView()
				.frame(height: 200)

			ImageView()
				.navigationBarTitle(Text("Map View"))
				.navigationBarHidden(true)

			DescriptionView()
			Spacer()
		}
	}
}


// Map View
struct MapView: UIViewRepresentable {
	func makeUIView(context: Context) -> MKMapView {
		MKMapView(frame: .zero)
	}
	
	func updateUIView(_ view: MKMapView, context: Context) {
		let coordinate = CLLocationCoordinate2D(
			latitude: 34.011286, longitude: -116.166868)
		let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		view.setRegion(region, animated: true)
	}
}


// Image View
struct ImageView : View {
	var body: some View {
		NavigationButton(destination: MapView().navigationBarTitle(Text("Map View"))) {
			Image(systemName: "play.circle")
				.resizable()
				.foregroundColor(.black)
				.frame(width: 200, height: 200)
				.offset(y: -110)
				.padding(.bottom, -100)
		}
	}
}


// Description View
struct DescriptionView : View {
	var body: some View {
		Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Scelerisque felis imperdiet proin fermentum leo vel orci. Arcu odio ut sem nulla pharetra diam sit amet nisl. Sem et tortor consequat id porta nibh venenatis cras. Sem fringilla ut morbi tincidunt augue interdum velit euismod. Nulla malesuada pellentesque elit eget gravida. At ultrices mi tempus imperdiet nulla malesuada pellentesque elit. Lectus nulla at volutpat diam ut. Nullam non nisi est sit amet facilisis magna etiam tempor. Eget mi proin sed libero enim. Nullam ac tortor vitae purus faucibus.")
			.lineLimit(nil)
			.padding(.horizontal, 20)
	}
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
