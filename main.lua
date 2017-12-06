local ModTest = registerMod("ModTest", 1)
local DamageUP = Isaac.GetItemIdByName("DamageUP")

function ModTest:CacheUpdate(player, cacheFlag)
  local player = Isaac.GetPlayer(0)
  
  if player:HasCollectible(DamageUP) then 
    if cacheFlag == cacheFlag.CACHE_DAMAGE then
      player.Damage = player.Damage + 1;
      Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.BLOOD_EXPLOSION, 0, player.Position, Vector(0, 0), player)
    end
  end
end

ModTest:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, ModTest.CacheUpdate)