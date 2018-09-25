--[[
LR_LiveRoster_Class

Requires: 
../Util/Util.lua
../Const/Const.lua
../OOP/OOP.lua
../RosterClass/LR_Roster_Class.lua
LR_LiveCharacter_Class.lua

API:
MyLiveRoster = LR_LiveRoster_Class:New();
MyLiveRoster:UpdateLiveRoster();



]]

LR_LiveRoster_Class = {};
function LR_LiveRoster_Class:New()
   local GuildRoster = {
	Roster = LR_Roster_Class:New(),
	__Mains = {},
	__ShortNames = {},
	__Alts = {},
	__Promotions= {},
	__RosterErrors = {}
   }
   LR_OOP.InheritClass(LiveRoster,LR_LiveRoster_Class);
   return GuildRoster;
end
function LR_LiveRoster_Class:__ActivateCharacters()
   for Key, Character in pairs(self.Roster) do
	LR_OOP.InheritClass(Character,LR_LiveCharacter_Class);
	Character:Classify();
   end
   self:__SetUpdated();
end
function LR_LiveRoster_Class:__SortMainsAndAlts()
   for Index, Character in pairs(self.Roster) do
	  if Character:IsMain() then 
         table.insert(self.__Mains,Character); 
      elseif Character:GetMainShortName() then
         table.insert(self.__Alts,Character);
      else
         table.insert(self.__RosterErrors,{Character, LR_ERROR_INVALIDCOMMENT});
      end
   end
end
function LR_LiveRoster_Class:__ConnectAlts()
   for Index, AltCharacter in pairs(self.__Alts) do
      local Main = self.ShortNames[AltCharacter:GetMainShortName()];
      if Main then
		AltCharacter:SetMain(Main);
		Main:AddAlt(AltCharacter)
      else
		tinsert(__RosterErrors, {Main, LR_ERROR_MAINNOTFOUND})
	  end
   end
end
function LR_LiveRoster_Class:__CalculatePromotions()
  -- <Move to ace 3 storage/addon settings>
  local RankDays = {0,0, 0, 0, 0, 274, 152, 60, 30};
  local ActiveDays = {0,0, 0, 0, 0,   7,   7,  7,  6};
  -- </Move to ace 3 settings>
   local Today = date("*t");
   for MainIndex, Main in pairs(self.__Mains) do
	local DaysInGuild = LR_TotalDays(Today) - LR_TotalDays(Main:GetJoinDate());
	local DateRank = 9;
	local RankIndex;
	for RankIndex=9,1,-1 do
		if DaysInGuild > RankDays[RankIndex] and LR_TotalDays(Main:GetLastOnline()) < ActiveDays[RankIndex] then
			DateRank=RankIndex;
		else
			break;
		end
	end
	if DateRank > Main:GetRankIndex() then
		Main:SetPromotion(DateRank);
		table.insert(self.__Promotions,Main)
	end
   end
end
function LR_LiveRoster_Class:UpdateLiveRoster()
	self:__PrepUI();
	self:__ActivateCharacters();
	self:__SortMainsAndAlts();
	self:__ConnectAlts();
	self:__CalculatePromotions();
end