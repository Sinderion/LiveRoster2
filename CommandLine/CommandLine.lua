LiveRoster = LR_LiveRoster_Class:New();
LiveRoster:PrepUI();
LiveRoster:LoadLiveRoster();
LiveRoster:SortMainsAndAlts();
LiveRoster:ConnectAlts();
LiveRoster:CalculatePromotions();
local TestToon = "Sinderion-ShadowCouncil";
local Character = LiveRoster:GetCharacter(TestToon);
print(Character:GetRank());

