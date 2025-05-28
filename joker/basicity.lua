SMODS.Joker{
   key = 'basicity',
   loc_txt = {
      name = 'Basicity',
      text = {
         '{C:blue}Common{} Jokers give',
         '{C:chips}+14{} Chips and {C:mult}+3{} Mult',
         '{s:0.6}7 in 15 people are basic{}',
      },
   },
   atlas = 'jokers',
   rarity = 1,
   cost = 3,
   blueprint_compat = true,
   config = { extra = { mult_mod = 3, chip_mod = 14 }},
   pos = {x = 9, y = 0},
   calculate = function(self, card, context)
      if context.joker_main then
         local mult = 0
         local chips = 0
         for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.rarity == 1 then
               mult = mult + card.ability.extra.mult_mod
               chips = chips + card.ability.extra.chip_mod
            end
         end
         return {
            mult = mult,
            chips = chips
         }
      end
   end
}
