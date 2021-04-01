class Opponent < Draco::Entity
  component Position, x: 100, y: 500
  component Rotation, angle: 0
  component Size, width: 100, height: 80
  component Sprite, path: 'sprites/misc/dragon-0.png'
  component Speed, speed: 4, acceleration: 2, deceleration: 0.5
  component Visible
  component Tag(:opponent_controlled)
  component Animated, frames: [
    { frames: 5, path: 'sprites/misc/dragon-0.png' },
    { frames: 5, path: 'sprites/misc/dragon-1.png' },
    { frames: 5, path: 'sprites/misc/dragon-2.png' },
    { frames: 5, path: 'sprites/misc/dragon-3.png' },
    { frames: 5, path: 'sprites/misc/dragon-4.png' },
    { frames: 5, path: 'sprites/misc/dragon-5.png' }
  ]
  component Collector
end
