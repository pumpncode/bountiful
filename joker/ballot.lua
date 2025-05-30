SMODS.Joker {
   key = 'ballot',
   loc_txt = {
      name = 'Ballot Box',
      text = {
      'Gains {C:chips}+#2#{} Chip for',
      'every {C:attention}card score{}',
      '{C:inactive}Currently{} {C:chips}+#1#{}',
      '{s:0.6}I played my part!{}'
      }
   },
   atlas = 'jokers',
   pos = { x = 0, y = 1 },
   rarity = 1,
   cost = 6,
   blueprint_compat = true,
   perishable_compat = false,
   demicoloncompat = true,
   config = { extra = { chips = 0, chip_mod = 1 } },
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
   end,
   calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.blueprint then
         card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
         card:juice_up(0.5, 0.5)
         return {
            message = '+'..card.ability.extra.chip_mod,
            colour = G.C.CHIPS,
         }
      elseif context.joker_main then
         return {
            chips = card.ability.extra.chips
         }
      end
   end,
   set_badges = function(self, card, badges)
   badges[#badges+1] = create_badge('suggested by @intersectingplanes', G.C.BLACK, G.C.WHITE, 0.8 )
   end
}
