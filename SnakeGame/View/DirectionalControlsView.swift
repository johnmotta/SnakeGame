//

import SwiftUI

struct DirectionalControlsView: View {
    var onUp: () -> Void
    var onDown: () -> Void
    var onLeft: () -> Void
    var onRight: () -> Void
    
    var body: some View {
        VStack {
            Button(action: onUp) {
                Image(systemName: "arrow.up")
                    .resizable()
                    .frame(width: 30, height: 40)
            }
            .accessibility(identifier: "arrow.up")
            
            HStack {
                Button(action: onLeft) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 40, height: 30)
                        .padding(.horizontal)
                }
                .accessibility(identifier: "arrow.left")

                Button(action: onRight) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 40, height: 30)
                        .padding(.horizontal)
                }
                .accessibility(identifier: "arrow.right")

            }
            Button(action: onDown) {
                Image(systemName: "arrow.down")
                    .resizable()
                    .frame(width: 30, height: 40)
            }
            .accessibility(identifier: "arrow.down")

        }
    }
}

//struct DirectionalControlsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DirectionalControlsView()
//    }
//}
