local atlas = SMODS.Atlas {
   key = 'decks',
	 path = 'decks.png',
	 px = 71,
	 py = 95,
}

SMODS.Back{
   key = 'burgundy',
   atlas = 'decks',
   pos = {x = 0, y = 0},
   loc_txt = {
      name = 'Burgundy Deck',
      text = {
         '{C:hearts}Hearts{} and {C:diamonds}Diamonds{}',
         'are {C:dark_edition}Holographic{}',
         'No {C:money}Boss Blind{} reward'
      },
   },
   apply = function(self)
      G.E_MANAGER:add_event(Event({
         func = function()
            for i = #G.playing_cards, 1, -1 do
               local card = G.playing_cards[i]
               if card.base.suit == 'Hearts' or card.base.suit == 'Diamonds' then
                  card:set_edition('e_holo', nil, true)
               end
            end
            G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
            G.GAME.modifiers.no_blind_reward.Boss = true
            return true
         end
      }))
   end
}

SMODS.Back{
   key = 'beige',
   atlas = 'decks',
   pos = {x = 1, y = 0},
   loc_txt = {
      name = 'Beige Deck',
      text = {
         '{C:hearts}Hearts{} and {C:spades}Spades{}',
         'are {C:attention}Lucky Cards{}',
         'No {C:money}Interest{}'
      },
   },
   apply = function(self)
      G.E_MANAGER:add_event(Event({
         func = function()
            for i = #G.playing_cards, 1, -1 do
               local card = G.playing_cards[i]
               if card.base.suit == 'Hearts' or card.base.suit == 'Spades' then
                  card:set_ability(G.P_CENTERS["m_lucky"])
               end
            end
            G.GAME.modifiers.no_interest = true
            return true
         end
      }))
   end
}

SMODS.Back{
   key = 'bleak',
   atlas = 'decks',
   pos = {x = 2, y = 0},
   loc_txt = {
      name = 'Bleak Deck',
      text = {
         'Cards have {C:green}1 in 2{}',
         'chance to be {C:dark_edition}Negative{}',
         '{C:red}No money at end of round{}',
         '{C:red}-2{} discards'
      },
   },
   apply = function(self)
      G.E_MANAGER:add_event(Event({
         func = function()
            for i = #G.playing_cards, 1, -1 do
               if pseudorandom('bleak') < 0.5 then
                  G.playing_cards[i]:set_edition('e_negative', nil, true)
               end
            end
            G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
            G.GAME.modifiers.no_blind_reward.Small = true
            G.GAME.modifiers.no_blind_reward.Big = true
            G.GAME.modifiers.no_blind_reward.Boss = true
            G.GAME.modifiers.no_interest = true
            G.GAME.modifiers.money_per_hand = 0
            return true
         end
      }))
   end,
   config = {discards = -2},
   loc_vars = function(self)
      return { vars = { self.config.discards }}
   end,
}

SMODS.Back{
   key = 'blanch',
   atlas = 'decks',
   pos = {x = 3, y = 0},
   loc_txt = {
      name = 'Blanched Deck',
      text = {
         '{C:attention}4s{} only',
         '{C:attention}4{} discards',
         '{C:attention}4{} dollars',
         '{C:attention}4{} hand size',
         '{C:attention}4{} joker slots',
         '{C:attention}4{} consumable slots',
      },
   },
   apply = function(self)
      G.E_MANAGER:add_event(Event({
         func = function()
            for i = #G.playing_cards, 1, -1 do
               local card = G.playing_cards[i]
               if card:get_id() ~= 4 then
                  card:remove()
               end
            end
            return true
         end
      }))
   end,
   config = {hand_size = -4, discards = 1, consumable_slot = 2, joker_slot = -1},
   loc_vars = function(self)
      return { vars = { self.config.hand_size, self.config.discards, self.config.joker_slot, self.config.consumable_slot}}
   end,
}
