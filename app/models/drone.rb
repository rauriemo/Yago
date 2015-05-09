class Drone < ActiveRecord::Base
  # Remember to create a migration!
  def keypress(sender, key)
    p "*" * 80
    if key == "up"
      p "im going up"
      drone.up(0.1)
    elsif key == "down"
      p "im going down"
      drone.down(0.1)
    elsif key == "right"
      p "im turning right"
      drone.turn_right(0.1)
    elsif key == "left"
      p "im turning left"
      drone.turn_left(0.5)
    elsif key == "t"
      p "im taking off"
      drone.take_off
    elsif key == "q"
      p "im landing"
      after(2.seconds) {drone.hover.land}
      # after(6.seconds) {drone.stop}
    elsif key == "w"
      p "im going forwards"
      drone.forward(0.1)
    elsif key == "s"
      p "im going backwards"
      drone.backward(0.1)
    elsif key == "d"
      p "im going right"
      drone.right(0.1)
    elsif key == "a"
      p "im going left"
      drone.left(0.1)
    elsif key == "h"
      p "im hovering"
      drone.hover
    elsif key == "f"
      p "im flipping"
      after(1.seconds) {drone.animate(:flip_ahead, 1000)}
      after(3.seconds) {drone.hover}
    elsif key == "c"
      p "im shaking"
      drone.animate("flipAhead", 1500)
    end
    p key
  end

  def fly(*data)
    drone.take_off
    after(5.seconds) { drone.up(0.5) }
    after(7.seconds) { drone.hover }
    after(10.seconds) {drone.right(0.2)}
    after(12.seconds) {drone.hover}
    after(13.seconds) {drone.turn_right(0.01)}
    after(17.seconds) { drone.hover.land }
    after(22.seconds) { drone.stop }
    # after(13.seconds) {
    #   every(0.5){

    #   }
    #  }
  end
end
