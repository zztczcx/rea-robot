#!/usr/bin/env ruby

require "./rea_robot.rb"

commander = ReaRobot::Commander.new()
commander.load_commands(ARGV[0])

