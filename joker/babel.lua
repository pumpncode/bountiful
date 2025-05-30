SMODS.Joker{
   key = 'babel',
   loc_txt = {
      name = 'Babel',
      text = {
         '#1#',
         '{s:0.6}now with ignored boss blinds!{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 3, y = 0},
   rarity = 3,
   cost = 9,
   blueprint_compat = true,
   loc_vars = function(self, info_queue, card)
      local string = "k_babel_"
      local sd = pseudorandom_element({1,2,3,4,5,6,7}, pseudoseed("babel"))
      return {
         vars = {
            localize(string .. sd)
         }
      }
   end,
   calculate = function(self, card, context)
      if context.final_scoring_step then
         create_playing_card({front = pseudorandom_element(G.P_CARDS, pseudoseed('babel')), center = G.P_CENTERS.m_wild}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
         return {
            message = "+!",
            playing_cards_created = {true}
         }
      end
   end
}
