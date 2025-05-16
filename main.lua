B = {}

SMODS.Atlas{
    key = 'jokers',
    path = 'atlas.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
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
'battery',
'beast',
'bechdel',
'beneficiary',
'bill',
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
'bulletin',
}

for i = 1, #B.enabledJokers do
  pcall(function()
    return NFS.load(SMODS.current_mod.path .. '/joker/' .. B.enabledJokers[i] .. '.lua')()
  end)
end

assert(SMODS.load_file('challenges.lua'))()
assert(SMODS.load_file('decks.lua'))()
