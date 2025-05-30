SMODS.Joker{
   key = 'bottom_quark',
   loc_txt = {
      name = 'Bottom Quark',
      text = {
         '{C:dark_edition}Spectral{} cards appear in',
         'the {C:attention}shop{} and {C:red}decay{} into',
         'two {C:tarot}Tarots{} when {C:attention}starting{}',
         '{C:attention}blind{} {C:inactive}(doesn\'t need room){}',
         '{s:0.6}started from a bottom in a pair{}',
         '{s:0.6}(as in, a bottom and anti-bottom pair){}'
      },
   },
   atlas = 'jokers',
   rarity = 2,
   cost = 7,
   unlocked = true,
   discovered = false,
   blueprint_compat = false,
   eternal_compat = true,
   perishable_compat = true,
   config = { extra = { set = false }},
   pos = {x = 2, y = 2},
	calculate = function(self, card, context)
      if not card.ability.extra.set and G.GAME.spectral_rate < 2 and not context.blueprint then
         G.GAME.spectral_rate = G.GAME.spectral_rate + 2
         card.ability.extra.set = true
      end
      if (context.selling_card or context.remove_playing_cards) and context.card == card and card.ability.extra.first ~= 0 and not context.blueprint then
         G.GAME.spectral_rate = G.GAME.spectral_rate - 2
      end
      if context.setting_blind and not context.blueprint then
         for k, v in ipairs(G.consumeables.cards) do
            if v.config.center_key and v.ability.consumeable then
               if v.config.center.set == 'Spectral' then
                  v:start_dissolve()
                  SMODS.add_card({set = 'Tarot', area = G.consumeables})
                  SMODS.add_card({set = 'Tarot', area = G.consumeables})
               end
            end
         end
      end
   end
}
