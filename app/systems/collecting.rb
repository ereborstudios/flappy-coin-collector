# Rather than running every tick, this system is dispatched
# by an observer whenever the Collected component is added
# to an entity.
class Collecting < Draco::System
  filter Collected

  def tick(args)
    entities.each do |entity|

      # Make the item disappear when it has been collected
      entity.components.delete(entity.components[:visible])

      # Play a sound when an item is collected
      args.gtk.queue_sound 'sounds/rpg-audio/handleCoins.ogg'

      # Display a message counting the total number of
      # items that have been collected by the same collector
      collector = collector_of(entity)
      $gtk.notify! "#{collector.class.name} #{collector.id} has collected #{collected_by(collector).count} entities."
    end
  end

  def collected_by(collector)
    world.filter(Collected).select do |entity|
      entity.collected.collector_id == collector.id
    end
  end

  def collector_of(entity)
    world.filter(Collector).find do |collector|
      collector.id == entity.collected.collector_id
    end
  end
end
