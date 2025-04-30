--1.0.2

SMODS.Joker{
   key = 'blackmail',
   loc_txt = {
      name = 'Blackmail',
      text = {
         '{C:blue}+2{} Joker slots, {C:red}-3{} hands',
         'Creates a Boss Tag',
         'after blind played',
         'or when destroyed',
         '{s:0.6}for i require something of you.{}'
      },
   },
   atlas = 'jokers',
   rarity = 1,
   cost = 5,
   unlocked = true,
   discovered = false,
   blueprint_compat = false,
   eternal_compat = true,
   perishable_compat = true,
   config = { extra = { first = 0 }},
   pos = {x = 4, y = 1},
	calculate = function(self, card, context)
      if card.ability.extra.first == 0 and not context.blueprint then
         G.jokers.config.card_limit = G.jokers.config.card_limit + 2
         card.ability.extra.first = 1
         return{
            message = '+2 Slots'
         }
      end
      if context.setting_blind and not context.blueprint then
         if G.GAME.current_round.hands_left > 3 then
            ease_hands_played(-3)
            return{
               message = '-3 hands'
            }
         else
            local hand_sub = G.GAME.current_round.hands_left - 1
            ease_hands_played(-hand_sub)
            return{
               message = '-'..hand_sub..' hands'
            }
         end
      end
      if context.ending_shop and not context.blueprint then
         G.E_MANAGER:add_event(Event({
            func = (function()
               add_tag(Tag('tag_boss'))
               play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
               play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
               return true
            end)
         }))
      end
      if (context.selling_card or context.remove_playing_cards) and context.card == card and not context.blueprint then
         G.jokers.config.card_limit = G.jokers.config.card_limit - 2
         G.E_MANAGER:add_event(Event({
            func = (function()
               add_tag(Tag('tag_boss'))
               play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
               play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
               return true
            end)
         }))
      end
   end
}
