# Handle input events by updating each player-controlled entity
class HandleInput < Draco::System
  filter PlayerControlled

  def tick(args)
    keyboard = args.inputs.keyboard
    entities.each do |entity|
      entity.components.add Flying.new(direction: :up) if keyboard.w
      entity.components.add Flying.new(direction: :left) if keyboard.a
      entity.components.add Flying.new(direction: :down) if keyboard.s
      entity.components.add Flying.new(direction: :right) if keyboard.d

      if keyboard.key_up.w || keyboard.key_up.a || keyboard.key_up.s || keyboard.key_up.d
        entity.components.delete(entity.components[:flying])
      end
    end
  end
end
