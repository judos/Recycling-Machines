-- Recycling Machine Entities
-- This is essentially a copy of the assembling machine entities
-- Ingredients is always 1, so crafting categories are added to ensure that...
-- If you can make it only in a level X machine, you can recycle it only at that level of recycling-machine
-- The exception is recipes with fluids. You can recycle them only in level 3 recycling machines.
-- TODO: Consider making them behave like furnaces and accept anything that goes past them
--       instead of recycling only one type of a item at a time
--       reverse-factory mod has this pretty much covered though

-- We need a special south facing pipe with a recycling logo on it for recycling-machine 3
require ("prototypes.recyclingpipes")

data:extend(
{
  {
    type = "assembling-machine",
    name = "recycling-machine-1", -- a change from assembling machine
    icon = "__ZRecycling__/graphics/icons/recycling-machine-1.png", -- a change from assembling machine
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "recycling-machine-1"}, -- a change from assembling machine
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "recycling-machine", -- a change from assembling machine
    animation =
    {
      filename = "__ZRecycling__/graphics/entity/recycling-machine-1/recycling-machine-1.png", -- a change from assembling machine
      priority="high",
      width = 99,
      height = 102,
      frame_count = 32,
      line_length = 8,
      shift = {0.25, -0.1}
    },
    crafting_categories = {"recycling-1"}, -- a change from assembling machine
    crafting_speed = 0.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.05 / 1.5
    },
    energy_usage = "90kW",
    ingredient_count = 1,  -- a change from assembling machine
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  },
  {
    type = "assembling-machine",
    name = "recycling-machine-2", -- a change from assembling machine
    icon = "__ZRecycling__/graphics/icons/recycling-machine-2.png", -- a change from assembling machine
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "recycling-machine-2"}, -- a change from assembling machine
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "recycling-machine", -- a change from assembling machine
    animation =
    {
      filename = "__ZRecycling__/graphics/entity/recycling-machine-2/recycling-machine-2.png", -- a change from assembling machine
      priority = "high",
      width = 113,
      height = 99,
      frame_count = 32,
      line_length = 8,
      shift = {0.4, -0.06}
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"recycling-1", "recycling-2"}, -- a change from assembling machine
    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "150kW",
    ingredient_count = 1, -- a change from assembling machine
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  {
    type = "assembling-machine",
    name = "recycling-machine-3", -- a change from assembling machine
    icon = "__ZRecycling__/graphics/icons/recycling-machine-3.png", -- a change from assembling machine
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "recycling-machine-3"}, -- a change from assembling machine
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__ZRecycling__/graphics/entity/recycling-machine-3/recycling-machine-3.png", -- a change from assembling machine
      priority = "high",
      width = 142,
      height = 113,
      frame_count = 32,
      line_length = 8,
      shift = {0.84, -0.09}
    },
    crafting_categories = {"recycling-1", "recycling-2", "recycling-3", "recycling-with-fluid"}, -- a change from assembling machine
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 1, -- a change from assembling machine
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  }
  
})