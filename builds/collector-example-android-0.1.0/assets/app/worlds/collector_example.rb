class CollectorExample < Draco::World
  include Draco::Events
  include Draco::Common::World

  entity Player, as: :player
  entity Opponent, as: :opponent

  systems Autoplayer,
          HandleInput,
          HandleMovement,
          ItemMovement,
          SpawnItems,
          DestroyItems,
          Collect

  observe Collecting
end
