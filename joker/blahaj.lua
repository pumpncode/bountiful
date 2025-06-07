SMODS.Joker{
   key = 'blahaj',
   loc_txt = {
      name = 'Blåhaj',
      text = {
         'Converts scoring',
         '{C:attention}face cards{}',
         'into {C:attention}Queens{}',
         '{s:0.6}I see you{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 6, y = 2},
   rarity = 3,
   cost = 7,
   unlocked = true,
   discovered = false,
   blueprint_compat = true,
   eternal_compat = true,
   perishable_compat = true,
   pools = {["Joker"] = true},
   calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
         local recall = context.other_card:get_id()
         if recall == 11 or recall == 13 then
            assert(SMODS.change_base(context.other_card, nil, 'Queen'))
            return {
               message = 'Promoted!'
            }
         elseif recall == 12 then
            return
         elseif context.other_card:is_face() then
            assert(SMODS.change_base(context.other_card, nil, 'Queen'))
            return {
               message = 'Promoted!'
            }
         end
      end
   end
}