SMODS.Joker{
   key = 'baseten',
   loc_txt = {
      name = 'Base Ten',
      text = {
         '{X:mult,C:white}xN{} Mult every scored {C:attention}10{}',
         'where {C:red}N{} is {C:attention}log base 10{} of',
         'the current {C:chips}Chip{} value',
         '{s:0.6}this really logs my rhythms{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 3, y = 1},
   rarity = 3,
   cost = 10,
   unlocked = true,
   discovered = false,
   blueprint_compat = true,
   eternal_compat = true,
   perishable_compat = true,
   config = { extra = { Xmult = 10 }},
   pools = {["Joker"] = true},
   set_badges = function(self, card, badges)
      badges[#badges+1] = create_badge('suggested by @verigold', G.C.BLACK, G.C.WHITE, 0.8 )
   end,
   calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
         if context.other_card:get_id() == 10 then
            return {
               Xmult_mod = math.log(hand_chips, 10),
               message = 'x'..(math.floor(math.log(hand_chips, 10) * 10000 + 0.5) / 10000)
            }
         end
      end
   end
}