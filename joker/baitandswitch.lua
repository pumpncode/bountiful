B.baitrares = {
   {x=0,y=3},
   {x=5,y=4},
   {x=6,y=4},
   {x=7,y=4},
   {x=8,y=4},
   {x=9,y=4},
   {x=8,y=6},
   {x=0,y=7},
   {x=1,y=7},
   {x=3,y=7},
   {x=7,y=7},
   {x=5,y=10},
   {x=5,y=11},
   {x=5,y=12},
   {x=6,y=12},
   {x=9,y=12},
   {x=6,y=14},
   {x=5,y=15},
   {x=7,y=15}
   }
SMODS.Joker{
   key = 'baitandswitch',
   loc_txt = {
      name = 'Bait and Switch',
      text = {
         '{C:blue}+5{} free rerolls',
         'Doubles shop prices',
         '{s:0.6}ha, gotcha! don\'t sue me.{}',
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
   config = { extra = { fix = 0, catch = 0, amount = 0 }},
   pos = {x = 0, y = 0},
	update = function(self, card, dt)
      if card.ability.extra.fix == 0 and context ~= nil and pseudorandom('baitandswitch') > 0.5 then
         card:set_edition(poll_edition('tag', nil, false, true))
         card.ability.extra.fix = 0.5
      end
   end,
   calculate = function(self, card, context)
      -- please count the amount of this joker i have because setting shop prices is really annoying
      local j = 1
      while j <= #G.jokers.cards do
         if G.jokers.cards[j].config.center.key == 'j_bbb_baitandswitch' then
            card.ability.extra.amount = card.ability.extra.amount + 1
         end
         j = j + 1
      end
      -- double shop prices (unfortunately, clearance sale and liquidation exist)
      if card.ability.extra.fix >= 1 then
         G.GAME.discount_percent = 100 - (100*(2^card.ability.extra.amount))
         if G.GAME.used_vouchers['v_clearance_sale'] == true then
            G.GAME.discount_percent = 100 - ((100*(2^card.ability.extra.amount))/4)
         end
         if G.GAME.used_vouchers['v_liquidation'] == true then
            G.GAME.discount_percent = 100 - ((100*(2^card.ability.extra.amount))/2)
         end
      end
      -- add rerolls
      if context.end_of_round and not context.blueprint and card.ability.extra.fix == 1 and card.ability.extra.catch == 0 then
      G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 5
      card.ability.extra.catch = 1
      calculate_reroll_cost(true)
      end
      -- reset after shop so the next shop also gets free rerolls
      if context.ending_shop and card.ability.extra.fix == 1 then
         card.ability.extra.catch = 0
      end
      -- when card sold, remove rerolls and reset shop prices
      if (context.selling_card or context.remove_playing_cards) and context.card == card and not context.blueprint then
         card.ability.extra.amount = card.ability.extra.amount - 1
         G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls - 5
         G.GAME.discount_percent = 100 - (100*(2^card.ability.extra.amount))
         if G.GAME.used_vouchers['v_clearance_sale'] == true then
            G.GAME.discount_percent = 100 - ((100*(2^card.ability.extra.amount))/4)
         end
         if G.GAME.used_vouchers['v_liquidation'] == true then
            G.GAME.discount_percent = 100 - ((100*(2^card.ability.extra.amount))/2)
         end
      end
      -- yes i have to put this here
      card.ability.extra.amount = 0
   end,
   add_to_deck = function(self, card, from_debuff)
      card.ability.extra.fix = 1
   end,
   set_sprites = function(self, card, front)
      if card and card.children and card.children.center and card.children.center.set_sprite_pos and self.discovered then
         card.children.center.atlas = G.ASSET_ATLAS['Joker']
         card.children.center:set_sprite_pos(pseudorandom_element(B.baitrares, pseudoseed('bait')))
      end
   end,
}
