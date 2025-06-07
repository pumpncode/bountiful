SMODS.Joker{
   key = 'haya_banknote',
   loc_txt = {
      name = 'Banknote Exchange',
      text = {
         '{C:blue}¥{} = {C:money}${}',
      },
   },
   atlas = 'crossmods',
   pos = {x = 0, y = 0},
   pixel_size = { w = 49, h = 95 },
   rarity = 3,
   cost = 9.56,
   blueprint_compat = true,
   perishable_compat = false,
   eternal_compat = false,
   pools = {["Joker"] = true},
   calculate = function(self, card, context)
      if context.setting_blind and G.GAME.payasaka_pyroxenes ~= G.GAME.dollars then
         local pass = (G.GAME.payasaka_pyroxenes + G.GAME.dollars) / 2
         local dollars = G.GAME.dollars
         local pyrox = G.GAME.payasaka_pyroxenes
         ease_dollars(pass - dollars)
         ease_pyrox(pass - pyrox)
      end
   end
}
SMODS.Joker{
   key = 'haya_behind',
   loc_txt = {
      name = 'Behind',
      text = {
         'Scored {C:spades}Spades{} become',
         '{C:chips}Bonus Cards{}, {C:dark_edition}Foil{},',
         'or {C:dark_edition,E:1}Negative{}',
      },
   },
   atlas = 'crossmods',
   pos = {x = 1, y = 0},
   rarity = "payasaka_ahead",
   cost = 10,
   blueprint_compat = true,
   perishable_compat = false,
   eternal_compat = false,
   pools = {["Joker"] = true, ["Meme"] = true},
   calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and context.other_card:is_suit('Spades') then
         local seed = pseudorandom('behind')
         local change = context.other_card
         if seed > 0.50 then
            G.E_MANAGER:add_event(Event{
               trigger = 'after',
               delay = 0.83,
               func = function()
                  change:set_ability(G.P_CENTERS["m_bonus"])
                  change:juice_up()
                  card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Bonus!', instant = true, colour = G.C.CHIPS })
                  return true
               end
            })
         elseif seed > 0.15 then
            G.E_MANAGER:add_event(Event{
               trigger = 'after',
               delay = 0.83,
               func = function()
                  change:set_edition("e_foil")
                  change:juice_up()
                  card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Foil!', instant = true, colour = G.C.CHIPS })
                  return true
               end
            })
         else
            G.E_MANAGER:add_event(Event{
               trigger = 'after',
               delay = 0.83,
               func = function()
                  change:set_edition("e_negative")
                  change:juice_up()
                  card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Negative!', instant = true, colour = G.C.CHIPS })
                  return true
               end
            })
         end
      end
   end
}
SMODS.Joker{
   key = 'haya_boardwalk',
   loc_txt = {
      name = 'Boardwalk',
      text = {
         'Creates a {C:purple,E:1}Property',
         'if {C:attention}played hand{} is',
         'a {C:attention}Four of a Kind'
      },
   },
   atlas = 'crossmods',
   pos = {x = 2, y = 0},
   rarity = 1,
   cost = 5,
   blueprint_compat = true,
   perishable_compat = false,
   eternal_compat = false,
   pools = {["Joker"] = true},
   calculate = function(self, card, context)
      if context.joker_main and next(context.poker_hands['Four of a Kind']) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
         G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
         return {
            func = function()
               G.E_MANAGER:add_event(Event({
                  func = (function()
                     G.E_MANAGER:add_event(Event({
                        func = function()
                           SMODS.add_card {
                              set = 'Property',
                           }
                           G.GAME.consumeable_buffer = 0
                           return true
                        end
                     }))
                     SMODS.calculate_effect({ message = 'Board Up!', colour = G.C.GREEN },
                        context.blueprint_card or card)
                     return true
                  end)
               }))
            end
         }
      end
   end
}
SMODS.Joker{
   key = 'haya_bluetooth',
   loc_txt = {
      name = 'Bluetooth Necklace',
      text = {
         '{X:mult,C:white}X19.98{} Mult',
         'Literally closes the game',
         'if score catches fire',
         '{C:inactive,s:0.6}your bluetooth device has disconnected'
      },
   },
   atlas = 'crossmods',
   pos = {x = 3, y = 0},
   rarity = 3,
   cost = 5,
   blueprint_compat = true,
   perishable_compat = false,
   eternal_compat = false,
   pools = {["Joker"] = true},
   update = function(self, card, dt)
      if G.GAME and G.GAME.blind and G.GAME.current_round.current_hand.chips * G.GAME.current_round.current_hand.mult > G.GAME.blind.chips then
         os.exit()
      end
   end,
   calculate = function(self, card, context)
      if context.joker_main then
         return {
            xmult = 19.98
         }
      end
   end
}
