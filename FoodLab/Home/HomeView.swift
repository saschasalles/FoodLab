import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach( data2, id: \.self ) { item in
                            VStack(alignment: .leading)  {
                                Image(item.imagePath)
                                    .resizable()
                                    .frame(maxWidth: 140, maxHeight: 165)
                                    .cornerRadius(10)
                                Text(item.name)
                                    
                                    .font(.headline)
                            }.foregroundColor (.gray)
                        }.frame(height: 200)
                    }.padding()
                }
                Spacer()
            }
            .navigationBarTitle(Text("Home"))
        }
    }
    }




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
