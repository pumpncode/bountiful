SMODS.Joker{
   key = 'botched',
   loc_txt = {
      name = 'Botched',
      text = {
      'Gains {C:chips}+15{} Chips for',
      'every {C:attention}hand played{}',
      'that is not your',
      'most played hand',
      '{C:inactive}Currently{} {C:chips}+#1#{}',
      '{s:0.6}this poor card. whatever happened?{}'
      }
   },
   atlas = 'jokers',
   pos = { x = 1, y = 1 },
   rarity = 3,
   cost = 7,
   blueprint_compat = true,
   demicoloncompat = true,
   config = { extra = { chips = 0, chip_mod = 15 } },
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.chipgain } }
   end,
   set_badges = function(self, card, badges)
      badges[#badges+1] = create_badge('suggested by @normalben', G.C.BLACK, G.C.WHITE, 0.8 )
   end,
   calculate = function(self, card, context)
   local handname, played, order = 'High Card', -1, 100
   if context.joker_main and not context.blueprint then
      for k, v in pairs(G.GAME.hands) do
         if v.played > played or (v.played == played and order > v.order) then
            played = v.played
            handname = k
         end
      end
      if handname ~= context.scoring_name and not context.blueprint then
         card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
         return {
            message = 'Whoops!',
            colour = G.C.CHIPS,
         }
      end
      return {
         chips = card.ability.extra.chips
      }
   end
end
}

