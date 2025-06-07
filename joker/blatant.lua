SMODS.Joker{
   key = 'blatant',
   loc_txt = {
      name = 'Blatant Self-Insert',
      text = {
         '{C:inactive}(Do I really need to? Fine...)',
         'First scored card {C:attention}turns{} {V:1}#1#{} into {V:2}#2#',
         '{C:inactive}Swaps every 3 rounds (#3#/3)',
      },
   },
   atlas = 'jokers',
   pos = {x = 8, y = 3},
   soul_pos = {x = 9, y = 3},
   rarity = 1,
   cost = 3,
   config = { extra = { turner = 'mult', rounds = 0 }},
   loc_vars = function(self, info_queue, card)
      if card.ability.extra.turner == 'mult' then
         return {
            vars = {
               "Mult",
               "Chips",
               card.ability.extra.rounds,
               colours = {
                  G.C.MULT,
                  G.C.CHIPS,
                  G.C.CHIPS,
               }
            }
         }
      else
         return {
            vars = {
               "Chips",
               "Mult",
               card.ability.extra.rounds,
               colours = {
                  G.C.CHIPS,
                  G.C.MULT,
                  G.C.CHIPS,
               }
            }
         }
      end
   end,
   pools = {["Joker"] = true},
   calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card == context.scoring_hand[1] then
         if card.ability.extra.turner == 'mult' and mult ~= 0 then
            return {
            chip_mod = mult,
            mult_mod = -mult,
            message = 'Pushed...'
            }
         elseif card.ability.extra.turner == 'chips' and hand_chips ~= 0 then
            return {
            chip_mod = -hand_chips,
            mult_mod = hand_chips,
            message = 'Pushed...'
            }
         end
      elseif context.end_of_round and context.cardarea == G.jokers then
         card.ability.extra.rounds = card.ability.extra.rounds + 1
         if card.ability.extra.rounds == 3 then
            card.ability.extra.rounds = 0
            if card.ability.extra.turner == 'mult' then
               card.ability.extra.turner = 'chips'
               return {
                  message = 'hand_chips!',
                  colour = G.C.CHIPS
               }
            else
               card.ability.extra.turner = 'mult'
               return {
                  message = 'mult!',
                  colour = G.C.MULT
               }
            end
         end
         return {
            message = 'PR\'d...'
         }
      end
   end
}
