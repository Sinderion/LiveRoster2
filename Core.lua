
LiveRoster = {}; -- Making it ace 3 addon.
LiveRoster.Roster = LR_LiveRoster_Class:New();
LiveRoster.Roster:UpdateRoster();
local TestToon = "Sinderion-ShadowCouncil";
local Character = LiveRoster.Roster:GetCharacterByName(TestToon);
print(Character:GetRank());

-- Spit out promotions.


