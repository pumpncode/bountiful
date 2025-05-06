SMODS.Joker{
   key = 'boarding_ticket',
   loc_txt = {
      name = 'Boarding Ticket',
      text = {
         'Cards drawn in the {C:attention}first hand{}',
         'have a {C:green}#1# in #2#{} chance to turn into',
         'the previously played {C:enhanced}Enhancement{}',
         '{s:0.6}welcome to our humble flight{}'
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
   config = { extra = { chance = 4, last = nil}},
   loc_vars = function(self, info_queue, card)
      return {
          vars = { G.GAME.probabilities.normal, card.ability.extra.chance }
      }
  end,
   pos = {x = 9, y = 2},
	calculate = function(self, card, context)
      if context.joker_main then
         for i = 1, #G.play.cards do
            if next(SMODS.get_enhancements(G.play.cards[i])) ~= nil then
            card.ability.extra.last = next(SMODS.get_enhancements(G.play.cards[i]))
            end
         end
      end
      if context.first_hand_drawn and card.ability.extra.last then
         for k, v in ipairs(G.hand.cards) do
            if pseudorandom('boarding_ticket') < G.GAME.probabilities.normal / card.ability.extra.chance then
               G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.15,
                  func = function() v:flip() return true end
               }))
               G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.1,
                  func = function() v:set_ability(card.ability.extra.last) card:juice_up(0.3,0.3) play_sound("card1")                     return true end
               }))
               G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.15,
                  func = function() v:flip() return true end
               }))
            end
         end
      end
   end
}