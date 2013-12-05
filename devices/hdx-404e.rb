require 'serialport'

class Hdx404e
  def initialize(dev = "tty.usbserial-A700eWsE")
    @dev = dev
  end

  def preset(preset_name)
    # This needs to be refactored, but I have to present this is in half an hour! ZOMG
    if preset_name == "halo"
      switch("A", "1")
      sleep 0.5
      switch("B", "2")
    end

    if preset_name == "presentation"
      switch("A", "3")
      sleep 0.5
      switch("B", "3")
    end

    if preset_name == "tv"
      switch("A", "4")
      sleep 0.5
      switch("B", "4")
    end
  end

  def switch(output, input)
    value = build_output_string(output, input)
    transmit value
  end

  private
  def transmit(value)
    3.times do
      serial_port.write value
      sleep 0.5
    end
  end

  def serial_port
    @serial_port ||= SerialPort.new("/dev/#{@dev}")
  end

  def build_output_string(output, input)
    # Hardware docs: http://www.monopricehub.com/files/manuals/5704_RS232_Control_120924.pdf
    #
    # The first byte is the computed value based on those docs
    # The second byte is 255 minus the value of the first byte (checksum)
    # The last two bytes are always the same

    o = output.downcase.ord - 97 # The output letter converted to it's 0 indexed value (ie: A = 1, B = 2, etc)
    i = input.to_i

    value = o * 4 + (i - 1)

    [value, 255 - value, 213, 123].pack('C*')
  end
end