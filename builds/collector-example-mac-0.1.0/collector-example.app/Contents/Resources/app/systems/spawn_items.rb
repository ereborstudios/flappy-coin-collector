# Every 30 ticks, add a new Coin entity to the world at a random position
# just above the viewport so it can fall into view. With the game running
# at 60 ticks per second, this should create coins at a rate of 2 per
# second while the system runs.
class SpawnItems < Draco::System
  include Draco::Periodic

  run_every 30

  def tick(args)
    world.entities << Coin.new({ position: { x: args.grid.rect.w.randomize(:ratio), y: 720 }})
  end
end
