SMODS.Joker{
   key = 'balancing',
   loc_txt = {
      name = 'Balancing Act',
      text = {
         '{C:blue}+#1#{} hands and {C:red}+#2#{} discards',
         '{C:attention}Turns{} a {C:blue}hand{} into a {C:red}discard{}',
         'when a {C:blue}hand{} is played and',
         'vice versa for {C:red}discards{}',
         '{s:0.6}tip the scales, split the room{}'
      },
   },
   atlas = 'jokers',
   pos = {x = 6, y = 1},
   rarity = 2,
   cost = 6,
   blueprint_compat = true,
   demicoloncompat = true,
   config = { extra = { hands = 2, discard = 3, check = false }},
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.hands, card.ability.extra.discard } }
   end,
   pools = {["Joker"] = true},
   set_badges = function(self, card, badges)
      badges[#badges+1] = create_badge('suggested by @normalben', G.C.BLACK, G.C.WHITE, 0.8 )
   end,
	calculate = function(self, card, context)
      if context.setting_blind and not context.blueprint then
         ease_discard(card.ability.extra.discard)
         ease_hands_played(card.ability.extra.hands)
         card.ability.extra.check = true
         return {
            message = 'Equal!'
         }
	elseif context.joker_main and G.GAME.current_round.hands_left > 1 and card.ability.extra.hands > 0 and card.ability.extra.check then
         ease_discard(1)
         ease_hands_played(-1)
         card.ability.extra.discard = card.ability.extra.discard + 1
         card.ability.extra.hands = card.ability.extra.hands - 1
         return {
            message = 'Tipped!'
         }
	elseif context.pre_discard and G.GAME.current_round.discards_left > 1 and card.ability.extra.discard > 0 and card.ability.extra.check then
         ease_discard(-1)
         ease_hands_played(1)
         card.ability.extra.discard = card.ability.extra.discard - 1
         card.ability.extra.hands = card.ability.extra.hands + 1
         return {
            message = 'Tipped!'
         }
	elseif context.selling_self or (context.remove_playing_cards and context.card == card) then
         ease_discard(-card.ability.extra.discard)
         ease_hands_played(-card.ability.extra.hands)
      end
   end
}
