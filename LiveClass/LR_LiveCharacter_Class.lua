--[[
LR_LiveCharacter_Class

Requires: 
../Util/Util.lua
../Const/Const.lua
../OOP/OOP.lua
../RosterClass/LR_Character_Class.lua

API: (Inherits LR_Character_Class, includes those methods)
MyLiveCharacter = LR_LiveCharacter_Class:New();
MyLiveCharacter:Classify(); -- Internally use guild note to set as many details as it can. main/alt/join date/main name
MyLiveCharacter:SetPromotion(7); --Ranks are 0, guild master, through 9, lowest rank
MyLiveCharacter:SetMain(MainCharacterObject);
MyLiveCharacter:AddAlt(CharacterObject);
MainShortName = MyLiveCharacter:GetMainShortName();
IsAMain = MyLiveCharacter:IsMain();
DateObject = MyLiveCharacter:GetJoinDate();


]]



LR_LiveCharacter_Class = {}
LR_OOP.InheritClass(LR_LiveCharacter_Class,LR_Character_Class);
function LR_LiveCharacter_Class:New()
   local Character = LR_Character_Class:New();
   Character.__Alts = {};
   Character.__Main = nil;
   Character.__IsMain = nil;
   Character.__MainShortName = nil;
   Character.__JoinDate = {
      Day = 1,
      Month = 1,
      Year = 2001
   };
   Character.__UpForPromotion = false;
   LR_OOP.InheritClass(Character,LR_LiveCharacter_Class);
   return Character;
end
function LR_LiveCharacter_Class:GetJoinDate()
	return self.__JoinDate;
end
function LR_LiveCharacter_Class:SetPromotion(Rank)
	self.__UpForPromotion = Rank;
end
function LR_LiveCharacter_Class:GetMainShortName()
	return self.__MainShortName;
end
function LR_LiveCharacter_Class:IsMain()
   if self.__Main then
      return false
   else
      return true;
   end
end
function LR_LiveCharacter_Class:AddAlt(Alt)
   table.insert(self.__Alts,Alt);
end
function LR_LiveCharacter_Class:SetMain(Main)
	self.__Main = Main;
end
function LR_LiveCharacter_Class:Classify()
   local Month, Day, Year = string.match(string.upper(self.__Note),"MAIN.-(%d+)[/%-%.](%d+)[/%-%.](%d+)");
   if Year and tonumber(Year) < 2000 then
      Year = Year + 2000;
   end
    if Month and Day and Year then
      self.__IsMain = true;
	  self.__JoinDate = {Year = Year, Month = Month, Day = Day};
    else
	 local Main = string.match(string.upper(self.__Note), "(.+) ALT");
	 if not Main then 
      Main = string.match(string.upper(self.__Note), "ALT (.+)");
	 end
	 if Main then 
		self.__MainShortName = Main;
	 end
	end	
end