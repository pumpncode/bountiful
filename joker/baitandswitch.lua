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
    config = { extra = { fix = 0 }},
    pos = {x = 0, y = 0},
	update = function(self, card, dt)
        if card.ability.extra.fix == 1 and not context.blueprint then
        G.GAME.discount_percent = -100
        if G.GAME.used_vouchers["v_clearance_sale"] == true then
            G.GAME.discount_percent = -50
        end
        if G.GAME.used_vouchers["v_liquidation"] == true then
            G.GAME.discount_percent = 0
        end
        end
        if card.ability.extra.fix == 0 and context ~= nil and pseudorandom('baitandswitch') > 0.5 then
            card:set_edition(poll_edition('tag', nil, false, true))
            card.ability.extra.fix = 0.5
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint then
        G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 8
        calculate_reroll_cost(true)
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.fix = 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff and not context.blueprint then
        G.GAME.discount_percent = 0
        if G.GAME.used_vouchers["v_clearance_sale"] == true then
            G.GAME.discount_percent = 25
        end
        if G.GAME.used_vouchers["v_liquidation"] == true then
            G.GAME.discount_percent = 50
        end
        end
    end,
    set_sprites = function(self, card, front)
        if card and card.children and card.children.center and card.children.center.set_sprite_pos then
            card.children.center.atlas = G.ASSET_ATLAS['Joker']
            card.children.center:set_sprite_pos(pseudorandom_element(B.baitrares, pseudoseed('bell')))
        end
    end,
}
