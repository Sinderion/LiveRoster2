
LiveRoster = LibStub("AceAddon-3.0"):NewAddon("LiveRoster");
LiveRoster.Guild = LR_LiveRoster_Class:New();
LiveRoster.Guild.Roster:UpdateRoster();
local TestToon = "Sinderion-ShadowCouncil";
local Character = LiveRoster.Guild.Roster:GetCharacterByName(TestToon);
print(Character:GetRank());

function LiveRoster:OnInitialize()
	print("LiveRoster Initialized.")
  -- Code that you want to run when the addon is first loaded goes here.
end

function LiveRoster:OnEnable()
    -- Called when the addon is enabled
end

function LiveRoster:OnDisable()
    -- Called when the addon is disabled
end

