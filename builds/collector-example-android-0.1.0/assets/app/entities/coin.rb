class Coin < Draco::Entity
  include Draco::State

  component Position
  component Speed, speed: 2
  component Rotation, angle: 0
  component Size, width: 70, height: 70
  component Sprite, path: 'sprites/coin_gold.png'
  component Visible

  state [Collectible, Collected]
end
