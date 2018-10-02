
LiveRoster = LibStub("AceAddon-3.0"):NewAddon("LiveRoster", "AceConsole-3.0");


function LiveRoster:OnInitialize()
	print("LiveRoster Initialized.");
	LiveRoster.Guild = LR_LiveRoster_Class:New();
	LiveRoster.Guild.Roster:UpdateRoster();
	self.db = LibStub("AceDB-3.0"):New("LiveRoster2DB");
	if self.db.global.Testme == 6 then
		LiveRoster:Print("Found test!");
	else
		LiveRoster:Print("No test! "..tostring(LiveRoster2DB.global.Testme));
		self.db.global.Testme = 6;
	end
	
	local TestToon = "Sinderion-ShadowCouncil";
	local Character = LiveRoster.Guild.Roster:GetCharacterByName(TestToon);
	print(Character:GetRank());
	
	
  -- Code that you want to run when the addon is first loaded goes here.
	-- eventually syncronize alt guild info, etc.
end

function LiveRoster:OnEnable()
    -- Called when the addon is enabled
end

function LiveRoster:OnDisable()
    -- Called when the addon is disabled
end


--[[ Ideas

- Logging of changes.

]]--