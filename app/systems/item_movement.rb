# Cause each collectible item to fall at a rate determined
# by its Speed.
class ItemMovement < Draco::System
  filter Position, Speed, Collectible

  def tick(args)
    entities.each do |entity|
      dy = entity.position.dy
      entity.position.dy = dy.lesser(entity.speed.speed * -1)
      entity.position.y += entity.position.dy
    end
  end
end
