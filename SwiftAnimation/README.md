#  SwiftUI Animation

To implement an animation in SwiftUI, we need the following three elements:

- A timing curve algorithm function
- A declaration that associates the state (specific dependency) with the timing curve function
- An animatable component that depends on the state (specific dependency)

Animation modifier respect the preceding one instead of the latest one
This means the order of the modifier matters a lot which may make 
the animation behave differently than what intended
