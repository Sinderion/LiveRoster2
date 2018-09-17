LR_OOP = {};
function LR_OOP.InheritClass(NewClass,ParentClassObject)
	for Key, Element in pairs(ParentClassObject) do
			NewClass[Key] = Element;
	end
end