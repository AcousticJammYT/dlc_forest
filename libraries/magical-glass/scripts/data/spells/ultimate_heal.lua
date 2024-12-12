local spell, super = Class("ultimate_heal", true)

function spell:onLightCast(user, target)
    local amount = math.ceil(Game:isLight() and user.chara:getStat("magic") or user.chara:getStat("magic") + 1)
    target:heal(amount)
end

function spell:onCast(user, target)
    if Game:isLight() then
        target:heal(math.ceil(user.chara:getStat("magic")))
    else
        super.onCast(self, user, target)
    end
end

return spell