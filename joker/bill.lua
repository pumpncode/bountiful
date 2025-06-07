SMODS.Joker{
   key = 'bill',
   loc_txt = {
      name = 'Bill Splitting',
      text = {
         'Copies abilities of the',
         '2 {C:attention}Jokers{} to the right',
         '{C:red}Makes all Jokers Rental and{}',
         '{C:red}sets all sell values to $0{}',
         '{s:0.6}purchases: #1# / #2#{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 5, y = 3},
   rarity = 2,
   cost = 8,
   blueprint_compat = true,
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.compat1 or "declined", card.ability.extra.compat2 or "declined" } }
   end,
   config = { extra = { compat1 = 'declined'}, { compat2 = 'declined'}},
   pools = {["Joker"] = true},
   update = function(self, card, dt)
      if G.jokers ~= nil then
         for i=1, #G.jokers.cards do
         if G.jokers.cards[i] == card and G.jokers.cards[i+1] then
            if G.jokers.cards[i+1].config.center.blueprint_compat then
               card.ability.extra.compat1 = 'accepted'
            else
               card.ability.extra.compat1 = 'declined'
            end
         end
         if G.jokers.cards[i] == card and G.jokers.cards[i+2] then
            if G.jokers.cards[i+2].config.center.blueprint_compat then
               card.ability.extra.compat2 = 'accepted'
            else
               card.ability.extra.compat2 = 'declined'
            end
         end
      end end
   end,
   calculate = function(self, card, context)
      if context.setting_blind and context.cardarea == G.jokers and #G.jokers.cards > 1 and not context.blueprint then
         for i=1, #G.jokers.cards do
            G.jokers.cards[i].ability.rental = true
            G.jokers.cards[i].sell_cost = 0
         end
         return {
            message = "Pay Up!",
            card = card,
            colour = G.C.MONEY,
            copy = 1 }
      end
      for i=1, #G.jokers.cards do
         if G.jokers.cards[i] == card and G.jokers.cards[i+1] then
            local ret = SMODS.blueprint_effect(card, G.jokers.cards[i+1], context)
            if ret then
               ret.colour = G.C.GREEN
               ret.card = context.blueprint_card or card
               return ret
            end
            if G.jokers.cards[i+2] then
               local ret2 = SMODS.blueprint_effect(card, G.jokers.cards[i+2], context)
               if ret2 then
               ret.colour = G.C.GREEN
               ret.card = context.blueprint_card or card
               return ret2
               end
            end
         end
      end
   end
}
