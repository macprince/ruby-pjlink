#!/usr/bin/env ruby
%w(net/telnet).each{|r| require r}

class Projector
  attr_accessor :address
  def initialize(address)
    @address = address
  end
  def command(cmd)
    cmd = "%1"+cmd
    s = Net::Telnet.new("Host"=>@address, "Port"=>4352, "Telnetmode"=> false, "Prompt"=>/%1/)
      s.write(cmd+"\r")
      response = s.waitfor("Prompt"=>/%1/).sub(/^PJLINK 0#{cmd}=/,"")
    s.close
    return response
  end

  def power_on
    command("POWR 1")
    puts "* Power On sent"
  end
  def power_off
     command("POWR 0")
     puts "* Power Off sent"
  end
  def input(input)
    if self.input_list.include?(input)
      command("INPT #{input}")
    end
    puts "* Switch to input #{input} sent"
  end
  def vmute_on
    command("AVMT 11")
    puts "* Video mute on sent"
  end
  def vmute_off
    command("AVMT 10")
    puts "* Video mute off sent"
  end
  def mute_on
    command("AVMT 21")
    puts "* Audio mute on sent"
  end
  def mute_off
    command("AVMT 20")
    puts "* Audio mute off sent"
  end
  def avmute_on
    command("AVMT 31")
    puts "* Audio/video mute on sent"
  end
  def avmute_off
    command("AVMT 30")
    puts "* Audio/video mute off sent"
  end

  def power_status
    case command("POWR ?")
      when "0"
        return "Standby"
      when "1"
        return "Power On"
      when "2"
        return "Cooling Down"
      when "3"
        return "Warming Up"
      end
  end 
  def mute_status
    return command("AVMT ?")
  end
  def input_list
     return command("INST ?").split.sort
  end
  def lamp_hours
    return command("LAMP ?").scan(/(\d+ \d)/).map{|i| i[0].split[0].to_i}
  end
  def device_name
    return command("NAME ?")
  end
  def manufacturer_name
    return command("INF1 ?")
  end
  def product_name
    return command("INF2 ?")
  end
  def pjlink_class
    return command("CLSS ?")
  end
  def other_info
    return command("INFO ?")
  end
  private :command
end
