SMODS.Joker{
   key = 'bulletin',
   loc_txt = {
      name = 'Bulletin',
      text = {
         'Copies ability of',
         '{C:attention}Joker{} to the right',
         '{C:red}Debuffs random Joker{}',
         '{s:0.8}Changes when blind is selected{}',
         '{s:0.6}waow, #1#{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 7, y = 0},
   rarity = 2,
   cost = 4,
   unlocked = true,
   discovered = false,
   blueprint_compat = true,
   eternal_compat = true,
   perishable_compat = true,
   config = { extra = { compat = 'compatible, cool.'}},
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.compat or "compatible, cool." } }
   end,
   pools = {["Joker"] = true},
   set_badges = function(self, card, badges)
      badges[#badges+1] = create_badge('suggested by @ctlaserdisc', G.C.BLACK, G.C.WHITE, 0.8 )
   end,
   update = function(self, card, dt)
      if G.jokers ~= nil then
         for i=1, #G.jokers.cards do
            if G.jokers.cards[i] == card and G.jokers.cards[i+1] and G.jokers.cards[i+1].config.center.blueprint_compat then
               card.ability.extra.compat = 'compatible, cool.'
            else
               card.ability.extra.compat = 'incompatible, huge L'
            end
         end
      end
   end,
   calculate = function(self, card, context)
      if context.ending_shop and not context.blueprint then
         for i=1, #G.jokers.cards do
            SMODS.debuff_card(G.jokers.cards[i], false, "b_bulletin")
         end
      elseif context.setting_blind and context.cardarea == G.jokers and #G.jokers.cards > 1 and not context.blueprint then
         local pool = {}
         for v, k in ipairs(G.jokers.cards) do
            if k ~= card then
               pool[#pool + 1] = k
            end
         end
         SMODS.debuff_card(pseudorandom_element(pool, pseudoseed('bulletin')), true, "b_bulletin")
         return {
            message = "Debuffed!",
            card = card,
            colour = G.C.RED,
            copy = 1
         }
      end
      for i=1, #G.jokers.cards do
         if G.jokers.cards[i] == card and G.jokers.cards[i+1] then
            local ret = SMODS.blueprint_effect(card, G.jokers.cards[i+1], context)
            if ret then
               ret.colour = G.C.RED
               ret.card = context.blueprint_card or card
               return ret
            end
         end
      end
   end
}
