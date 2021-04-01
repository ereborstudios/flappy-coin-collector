class HandleMovement < Draco::System
  filter Position, Speed

  def tick(args)
    entities.each do |entity|
      dy = entity.position.dy
      dx = entity.position.dx

      if entity.components[:flying]
        direction = entity.flying.direction

        if direction == :up
          dy += entity.speed.acceleration
          entity.position.dy = dy.lesser(entity.speed.speed)

          angle = entity.rotation.angle
          if entity.sprite.flip_horizontally
            angle -= 5
            angle = angle.greater(-20)
          else
            angle += 5
            angle = angle.lesser(20)
          end
          entity.rotation.angle = angle
        end

        if direction == :down
          dy -= entity.speed.acceleration
          entity.position.dy = dy.greater(entity.speed.speed * -1)

          angle = entity.rotation.angle
          if entity.sprite.flip_horizontally
            angle += 5
            angle = angle.lesser(20)
          else
            angle -= 5
            angle = angle.greater(-20)
          end
          entity.rotation.angle = angle
        end

        if direction == :right
          dx += entity.speed.acceleration
          entity.position.dx = dx.lesser(entity.speed.speed)
          entity.sprite.flip_horizontally = false

          angle = entity.rotation.angle
          if entity.sprite.flip_horizontally
            angle -= 5
            angle = angle.greater(-20)
          else
            angle += 5
            angle = angle.lesser(20)
          end
          entity.rotation.angle = angle
        end

        if direction == :left
          dx -= entity.speed.acceleration
          entity.position.dx = dx.greater(entity.speed.speed * -1)
          entity.sprite.flip_horizontally = true

          angle = entity.rotation.angle
          if entity.sprite.flip_horizontally
            angle -= 5
            angle = angle.greater(-20)
          else
            angle += 5
            angle = angle.lesser(20)
          end
          entity.rotation.angle = angle
        end

      else

        if dx < 0
          dx += entity.speed.deceleration
          entity.position.dx = dx.lesser(0)
        else
          dx -= entity.speed.deceleration
          entity.position.dx = dx.greater(0)
        end

        if dy < 0
          dy += entity.speed.deceleration
          entity.position.dy = dy.lesser(0)
        else
          dy -= entity.speed.deceleration
          entity.position.dy = dy.greater(0)
        end

        angle = entity.rotation.angle
        unless angle == 0
          angle < 0 ? angle += 5 : angle -= 5
          entity.rotation.angle = angle
        end
      end

      entity.position.x += entity.position.dx
      entity.position.y += entity.position.dy

      entity.position.x = entity.position.x.greater(args.grid.left).lesser(args.grid.right - entity.size.width)
      entity.position.y = entity.position.y.greater(args.grid.bottom).lesser(args.grid.top - entity.size.height)
    end
  end
end
