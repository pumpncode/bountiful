SMODS.Joker{
   key = 'brokerdealer',
   loc_txt = {
      name = 'Broker Dealer',
      text = {
         'Discarding a {C:attention}Gold{}',
         'card gives {C:money}$#1#{}',
         '{s:0.6}the deal of all time.{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 2, y = 0},
   rarity = 1,
   cost = 2,
   blueprint_compat = true,
   demicoloncompat = true,
   config = { extra = { dollars = 3 }},
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.dollars } }
   end,
   pools = {["Joker"] = true},
   calculate = function(self, card, context)
      if context.discard then
         if SMODS.has_enhancement(context.other_card, "m_gold") then
            return {
               dollars = card.ability.extra.dollars
            }
         end
      end
   end
}
