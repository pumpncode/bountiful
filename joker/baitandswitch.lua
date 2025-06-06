B.baitrares = { {x=0,y=3}, {x=5,y=4}, {x=6,y=4}, {x=7,y=4}, {x=8,y=4}, {x=9,y=4},
   {x=8,y=6}, {x=0,y=7}, {x=1,y=7}, {x=3,y=7}, {x=7,y=7}, {x=5,y=10}, {x=5,y=11},
   {x=5,y=12}, {x=6,y=12}, {x=9,y=12}, {x=6,y=14}, {x=5,y=15}, {x=7,y=15} }

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
   config = { extra = { bought = false, editioned = false, catch = 0 }},
   pos = {x = 0, y = 0},
   update = function(self, card, dt)
      if not card.ability.extra.bought and not card.ability.extra.editioned and card.edition == 'e_base' and pseudorandom('baitandswitch') > 0.5 then
         card:set_edition(poll_edition('tag', nil, false, true))
         card.ability.extra.editioned = true
      end
   end,
   calculate = function(self, card, context)
      if card.ability.extra.bought >= 1 and not context.blueprint then
         local count = 1
         for k, v in ipairs(G.jokers.cards) do
            if v.config.center.key == 'j_bbb_baitandswitch' then
               count = count + 1
            end
         end
         G.GAME.discount_percent = -2^count * 100
         if G.GAME.used_vouchers['v_liquidation'] == true then
            G.GAME.discount_percent = -2^count * 50
         elseif G.GAME.used_vouchers['v_clearance_sale'] == true then
            G.GAME.discount_percent = -2^count * 25
         end
      elseif context.end_of_round and not context.blueprint and card.ability.extra.bought == 1 then
         G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 5
         calculate_reroll_cost(true)
      end
      if (context.selling_card or context.remove_playing_cards) and context.card == card and not context.blueprint then
         G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls - 5
         G.GAME.discount_percent = 100
         if G.GAME.used_vouchers['v_liquidation'] == true then
            G.GAME.discount_percent = 50
         elseif G.GAME.used_vouchers['v_clearance_sale'] == true then
            G.GAME.discount_percent = 75
         end
      end
   end,
   add_to_deck = function(self, card, from_debuff)
      card.ability.extra.bought = 1
   end,
   set_sprites = function(self, card, front)
      if card and card.children and card.children.center and card.children.center.set_sprite_pos and self.discovered then
        card.children.center.atlas = G.ASSET_ATLAS['Joker']
        card.children.center:set_sprite_pos(pseudorandom_element(B.baitrares, pseudoseed('bait')))
      end
   end,
}
