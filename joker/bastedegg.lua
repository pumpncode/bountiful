SMODS.Joker{
   key = 'bastedegg',
   loc_txt = {
      name = 'Basted Egg',
      text = {
         'Has the sell value of',
         'all other {C:attention}Jokers{} combined',
         '{s:0.6}the egg cup is in fact tempered.{}'
      },
   },
   atlas = 'jokers',
   rarity = 1,
   cost = 3,
   unlocked = true,
   discovered = false,
   blueprint_compat = false,
   eternal_compat = false,
   perishable_compat = true,
   pos = {x = 8, y = 0},
   pools = {["Joker"] = true, ["Food"] = true},
   set_badges = function(self, card, badges)
      badges[#badges+1] = create_badge('suggested by @cloverpepsi', G.C.BLACK, G.C.WHITE, 0.8 )
   end,
   update = function(self, card, dt)
      card.ability.extra_value = 0
      card:set_cost()
      if G.jokers ~= nil then
      for i=1, #G.jokers.cards do
         if G.jokers.cards[i].config.center.key ~= "j_bbb_bastedegg" then
         card.ability.extra_value = card.ability.extra_value + G.jokers.cards[i].sell_cost
      end end end
      card.ability.extra_value = card.ability.extra_value - 1
      card:set_cost()
   end
}