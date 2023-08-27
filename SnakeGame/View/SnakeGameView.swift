//

import SwiftUI

struct SnakeGameView: View {
    @ObservedObject private var gameState = GameState()
    @State private var h: CGFloat = 30
    @State private var w: CGFloat = 30
    var body: some View {
        VStack {
            Spacer()
            ForEach(0..<10) { y in
                HStack {
                    ForEach(0..<10) { x in
                        ZStack {
                            if gameState.snake.head == Position(x: x, y: y) {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: w, height: h)
                                    .foregroundColor(.green)
                                    .accessibility(identifier: "snake.head")
                                
                            } else if gameState.snake.body.contains(Position(x: x, y: y)) {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: w, height: h)
                                    .foregroundColor(.green)
                                    .accessibility(identifier: "snake.body")
                                
                            } else if gameState.food.position == Position(x: x, y: y) {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: w, height: h)
                                    .foregroundColor(.red)
                                    .accessibility(identifier: "food")
                                    .rotationEffect(.degrees(gameState.animateEat ? 360 : 0))
                                    .onAppear {
                                        gameState.animateEat = false
                                    }
                                    .opacity(gameState.animateEat ? 0 : 1)
                                        .onTapGesture {
                                            withAnimation(.easeInOut(duration: 0.5)) {
                                                gameState.animateEat = true
                                            }
                                        }
                                
                            } else {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: w, height: h)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            Spacer()
            DirectionalControlsView(
                onUp: { gameState.updateDirection(.up) },
                onDown: { gameState.updateDirection(.down) },
                onLeft: { gameState.updateDirection(.left) },
                onRight: { gameState.updateDirection(.right) }
            )
        }
        .padding()
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            gameState.tick()
        }
        .gesture(DragGesture(minimumDistance: 0)
            .onEnded { value in
                let xDist = abs(value.translation.width)
                let yDist = abs(value.translation.height)
                
                if xDist > yDist {
                    if value.translation.width > 0 {
                        gameState.updateDirection(.right)
                    } else {
                        gameState.updateDirection(.left)
                    }
                } else {
                    if value.translation.height > 0 {
                        gameState.updateDirection(.down)
                    } else {
                        gameState.updateDirection(.up)
                    }
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SnakeGameView()
    }
}
