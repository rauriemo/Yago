require 'artoo'

class DronesController < ApplicationController

  # GET '/'
  def home
  end

  # GET '/drones/index'
  def index
    connection :ardrone, :adaptor => :ardrone, :port => '192.168.1.1:5556'
    device :drone, :driver => :ardrone, :connection => :ardrone

    connection :navigation, :adaptor => :ardrone_navigation, :port => '192.168.1.1:5554'
    device :nav, :driver => :ardrone_navigation, :connection => :navigation

    connection :keyboard, adaptor: :keyboard
    device :keyboard, driver: :keyboard, connection: :keyboard


    work do
      # on drone, :ready => :fly
      on keyboard, :key => :keypress
      drone.start(nav) # pass the nav object into the start method
      p nav
      p drone
    end

  end

end
