# When a falling item reaches the floor we should destroy it,
# to prevent uncollected items from accumulating off-screen.
class DestroyItems < Draco::System
  filter Position, Collectible

  def tick(args)
    entities.select { |e| e.position.y <= 10 }.each do |entity|
      world.entities.delete(entity)
    end
  end
end
