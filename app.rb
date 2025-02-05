require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

# Can now comment all this out because we've created the dynamic route
# get("/dice/2/6") do
#   @rolls = []

#   2.times do
#     die = rand(1..6)

#     @rolls.push(die)
#   end

#   erb(:two_six)
# end

# get("/dice/2/10") do
#   @rolls = []

#   2.times do
#     die = rand(1..10)

#     @rolls.push(die)
#   end

#   erb(:two_ten)
# end

# get("/dice/1/20") do
#   @rolls = []

#   1.times do
#     die = rand(1..20)

#     @rolls.push(die)
#   end

#   erb(:one_twenty)
# end

# get("/dice/5/4") do
#   @rolls = []

#   5.times do
#     die = rand(1..4)

#     @rolls.push(die)
#   end

#   erb(:five_four)
# end

# Creating dynamic route
get("/dice/:dice_param/:sides_param") do # dice_param and rolls_param are now params
  
  @num_dice = params.fetch("dice_param").to_i # fetching whatever the user inputs in the path in the bae term

  @num_sides = params.fetch("sides_param").to_i

  @rolls = []

  @num_dice.times do
    die = rand(1..@num_sides)
    @rolls.push(die)
  end

  erb(:flexible)
end
