class Autoplayer < Draco::System
  include Draco::Periodic
  filter OpponentControlled

  run_every 15

  def tick(args)
    entities.each do |entity|
      current = entity.components[:flying] ? entity.flying.direction : nil
      entity.components.add Flying.new(direction: [:up, :left, :down, :right].reject { |d| d == current }.sample)
    end
  end
end
