require "smaug.rb"

def tick args
  args.outputs.background_color = [ 0, 0, 20, 255 ]
  args.state.world ||= CollectorExample.new
  args.state.world.tick(args)
  args.outputs.debug << args.gtk.framerate_diagnostics_primitives
end
