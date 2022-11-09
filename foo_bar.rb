require "securerandom"

module DuplicationExample
  def identical(message, header: true)
    body = []
    body << "-- HEADER --" if header
    body << "-- MESSAGE --"
    body << message
    body << "-- FOOTER --"
    message = body.join("\n")

    if message.length > 100
      message[0, 100]
    else
      message
    end
  end

  def similar
    hex = SecureRandom.hex(20)
    hex.reverse
    hex += "-suffix"

    if hex.start_with?("z")
      hex += "something-else"
    end

    hex
  end
end

require "securerandom"

class AnotherExample
  def identical(message, header: true)
    body = []
    body << "-- HEADER --" if header
    body << "-- MESSAGE --"
    body << message
    body << "-- FOOTER --"
    message = body.join("\n")

    if message.length > 100
      message[0, 100]
    else
      message
    end
  end

  def similar
    hex = SecureRandom.hex(20)
    hex.reverse
    hex += "-suffix"

    if hex.start_with?("a")
      hex += "something"
    end

    hex
  end
end

class FooBar
  def run(items = gets.chomp.to_i)
    if items > 0
      list = []
      (1..items).each do |n|
        if n % 3 == 0 && n % 5 == 0
          list << "FOOBAR"
        elsif n % 3 == 0
          list << "FOO"
        elsif n % 5 == 0
          list << "BAR"
        else
          list << n
        end
      end
    else
      puts "Please enter a positive number"
    end

    list
  end
end

require "spec_helper"
require_relative "../foo_bar"

describe "FooBar" do
  it "returns correct list of items" do
    result = FooBar.new.run(15)

    expect(result.length).to eq(15)
    expect(result).to eq([
      1,
      2,
      "FOO",
      4,
      "BAR",
      "FOO",
      7,
      8,
      "FOO",
      "BAR",
      11,
      "FOO",
      13,
      14,
      "FOOBAR",
    ])
  end
end
