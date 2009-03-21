# This is mostly for regression testing and bugfix confirmation at the moment.

# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )
$:.unshift( File.join( File.dirname(__FILE__), "..", "ext", "rubygame" ) )

require 'rubygame'
include Rubygame


describe Clock do

  describe "with tick events" do

    before :each do
      @clock = Clock.new
      @clock.enable_tick_events
    end
    

    it "should cache ClockTicked events" do
      Clock.stub!(:delay).and_return(10)
      # Make sure they are the same exact object
      @clock.tick.should equal(@clock.tick)
    end

  end

end