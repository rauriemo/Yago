require 'artoo'

connection :ardrone, :adaptor => :ardrone, :port => '192.168.1.1:5556'
device :drone, :driver => :ardrone, :connection => :ardrone

connection :navigation, :adaptor => :ardrone_navigation, :port => '192.168.1.1:5554'
device :nav, :driver => :ardrone_navigation, :connection => :navigation

connection :keyboard, adaptor: :keyboard
device :keyboard, driver: :keyboard, connection: :keyboard


work do
  on drone, :ready => :fly
  on keyboard, :key => :keypress
  drone.start(nav) # pass the nav object into the start method
end

def keypress(sender, key)
  p "*" * 80
  if key == "up"
    drone.up
  elsif key == "q"
    drone.hover.land
    drone.stop
  elsif key == "down"
    drone.down
  end
  p key
  p sender
end

def fly(*data)
  drone.take_off
  # after(15.seconds) { drone.hover.land }
  # after(20.seconds) { drone.stop }
end