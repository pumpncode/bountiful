SMODS.Blind {
    name = 'The Bereaved',
    key = 'bereaved',
    atlas = 'bbb_blind',
    pos = {y = 0},
    dollars = 5,
    boss = { min = -100 },
    mult = 1,
    loc_vars = function(self)
        if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante then
            if G.GAME.round_resets.ante > 0 then
                return {vars = { G.GAME.round_resets.ante }}
            else
                return {vars = { 1 }}
            end
        else
            return {vars = { 1 }}
        end end,
    loc_txt = {
        name = 'The Bereaved',
        text = { '-#1# Chips for each',
                'remaining card in deck',}
    },
    vars = {'2 (Xante)'},
    discovered = true,
    boss_colour = HEX('5788CC'),
    calculate = function(self, blind, context)
        if context.final_scoring_step then
            local chips = _G.hand_chips or 0
            local call
            if G.GAME.round_resets.ante > 0 then
                call = (#G.deck.cards * G.GAME.round_resets.ante)
            else
                call = #G.deck.cards
            end
            if chips - call >= 0 then
                return {
                    chip_mod = -call,
                    sound = 'cancel',
                }
            else
                return {
                    chip_mod = -chips,
                    sound = 'cancel',
                }
            end
        end
    end
}

SMODS.Blind {
    name = 'The Brodequin',
    key = 'brodequin',
    atlas = 'bbb_blind',
    pos = {y = 1},
    dollars = 5,
    boss = { min = -100 },
    mult = 2,
    loc_vars = function(self)
        if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante then
            if G.GAME.round_resets.ante > 0 then
                return {vars = { 2 * G.GAME.round_resets.ante }}
            else
                return {vars = { 2 }}
            end
        else
            return {vars = { 2 }}
        end end,
    loc_txt = {
        name = 'The Brodequin',
        text = { '-#1# Mult for every',
                '$5 you have',}
    },
    vars = {'2 (Xante)'},
    discovered = true,
    boss_colour = HEX('BE9B63'),
    calculate = function(self, blind, context)
        if context.final_scoring_step then
            local mult = _G.mult or 0
            local call
            if G.GAME.round_resets.ante > 0 then
                call = (math.floor(G.GAME.dollars / 5) * G.GAME.round_resets.ante * 2)
            else
                call = 2
            end
            if mult - call >= 0 then
                return {
                    mult_mod = -call,
                    sound = 'cancel',
                }
            else
                play_sound('cancel', 0.75, 0.7)
                return {
                    mult_mod = -mult,
                    sound = 'cancel',
                }
            end
        end
    end
}

SMODS.Blind {
    name = 'The Bunt',
    key = 'bunt',
    atlas = 'bbb_blind',
    pos = {y = 2},
    dollars = 5,
    boss = { min = 2 },
    mult = 2,
    loc_txt = {
        name = 'The Bunt',
        text = { 'Uncommon jokers',
                'give X0.8 Mult',}
    },
    discovered = true,
    boss_colour = HEX('A6A6A6'),
    calculate = function(self, blind, context)
        if context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") then
            return {
                xmult = 0.7
            }
        end
    end
}

SMODS.Blind {
    name = 'The Bodewash',
    key = 'bodewash',
    atlas = 'bbb_blind',
    pos = {y = 3},
    dollars = 5,
    boss = { min = 3 },
    mult = 2,
    loc_vars = function(self)
        if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante then
            if G.GAME.round_resets.ante > 0 then
                return {vars = { 2 + G.GAME.round_resets.ante }}
            else
                return {vars = { 2 }}
            end
        else
            return {vars = { 2 }}
        end end,
    loc_txt = {
        name = 'The Bodewash',
        text = { '-#1# Chips for every',
                '$1 you have',}
    },
    vars = {'2 (-ante)'},
    discovered = true,
    boss_colour = HEX('886979'),
    calculate = function(self, blind, context)
        if context.final_scoring_step then
            local chips = _G.hand_chips or 0
            local call
            if G.GAME.round_resets.ante > 0 then
                call = G.GAME.dollars * ( G.GAME.round_resets.ante + 2)
            else
                call = 2
            end
            if chips - call >= 0 then
                return {
                    chip_mod = -call,
                    sound = 'cancel',
                }
            else
                play_sound('cancel', 0.75, 0.7)
                return {
                    chip_mod = -chips,
                    sound = 'cancel',
                }
            end
        end
    end
}

SMODS.Blind {
    name = 'The Bloodthirsty',
    key = 'bloodthirsty',
    atlas = 'bbb_blind',
    pos = {y = 4},
    dollars = 5,
    boss = { min = -100 },
    mult = 2,
    loc_txt = {
        name = 'The Bloodthirsty',
        text = { 'Most common suit',
                'gives X0.8 Mult',}
    },
    discovered = true,
    boss_colour = HEX('C3492F'),
    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play then
            local array, count, suits = {}, 0, {}
            for k, card in ipairs( G.playing_cards ) do
                local suit = card.base.suit
                array[suit] = array[suit] or 0
                array[suit] = array[suit] + 1
            end
            for suit, int in pairs(array) do
                if int > count then
                    count = int
                    suits = {suit}
                elseif int == count then
                    table.insert(suits, suit)
                end
            end
            local claim = context.other_card.base.suit
            for i = 1, #suits do
                if suits[i] == claim then
                    return {
                    xmult = 0.8
                    }
                end
            end
        end
    end
}

SMODS.Blind {
    name = 'The Burgee',
    key = 'burgee',
    atlas = 'bbb_blind',
    pos = {y = 5},
    dollars = 5,
    boss = { min = -100 },
    mult = 3,
    loc_txt = {
        name = 'The Burgee',
        text = { '-#1# Chips for each',
                'remaining discard',}
    },
    loc_vars = function(self)
    if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante then
        if G.GAME.round_resets.ante > 0 then
            return {vars = { 30 * G.GAME.round_resets.ante }}
        else
            return {vars = { 30 }}
        end
    else
        return {vars = { 30 }}
    end end,
    vars = {'30 [Xante]'},
    discovered = true,
    boss_colour = HEX('C3492F'),
    calculate = function(self, blind, context)
        if context.final_scoring_step then
            return {
                chips = math.max(G.GAME.current_round.discards_left, 0) * -30 * math.max(G.GAME.round_resets.ante, 1)
            }
        end
    end
}

