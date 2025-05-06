B = {}

SMODS.Atlas{
    key = 'jokers',
    path = 'atlas.png',
    px = 71,
    py = 95
}

SMODS.current_mod.optional_features = {
  cardareas = {unscored = true}
}

B.enabledJokers = {
'babel',
'baitandswitch',
'bakingsoda',
'balancing',
'ballot',
'banderole',
'barley',
'baseten',
'basicity',
'bastedegg',
'beast',
'bechdel',
'beneficiary',
'binder',
'bismuth',
'bitshift',
'blackmail',
'blahaj',
'boardandspilikins',
'boarding_ticket',
'bobber',
'botched',
'bottom_quark',
'bourgeoisie',
'brake',
'brokerdealer',
}

-- Register the jokers in custom order
for i = 1, #B.enabledJokers do
  local status, err = pcall(function()
    return NFS.load(SMODS.current_mod.path .. '/joker/' .. B.enabledJokers[i] .. '.lua')()
  end)
  sendDebugMessage('Loaded joker: ' .. B.enabledJokers[i], 'JokerHub')
  if not status then
    error(B.enabledJokers[i] .. ': ' .. err)
  end
end

assert(SMODS.load_file('challenges.lua'))()
assert(SMODS.load_file('decks.lua'))()
