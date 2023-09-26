-- credit: reals-dev
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Selection = game:GetService("Selection")

local convertclass = plugin:CreateToolbar("Convert Class")
local changeposition = plugin:CreateToolbar('Change Position')

local buttontolabel = convertclass:CreateButton("Button - Label", "Converts a TextButton into a TextLabel", "http://www.roblox.com/asset/?id=6031068433")
local positionx = changeposition:CreateButton("Copy Position X", "Copies Position X", "http://www.roblox.com/asset/?id=6034328955")
local positiony = changeposition:CreateButton("Copy Position Y", "Copies Position Y", "http://www.roblox.com/asset/?id=6034328955")
local positionz = changeposition:CreateButton("Copy Position Z", "Copies Position Z", "http://www.roblox.com/asset/?id=6034328955")
local copyall = changeposition:CreateButton('Copy all positions', 'Copies the whole position', 'http://www.roblox.com/asset/?id=6034328955')

local checkselection = false
local coord
local positiontype

buttontolabel.ClickableWhenViewportHidden = true

Selection.SelectionChanged:Connect(function()
	if checkselection == true then
		print('moved part one to the second part')
		checkselection = false
		local newpart = Selection:Get()
		if #newpart > 0 then
			local newpart2 = newpart[1]
			if positiontype == 'X' then
				newpart2.Position = Vector3.new(coord, newpart2.Position.Y, newpart2.Position.Z)
			elseif positiontype == 'Y' then
				newpart2.Position = Vector3.new(newpart2.Position.X, coord, newpart2.Position.Z)
			elseif positiontype == 'Z' then
				newpart2.Position = Vector3.new(newpart2.Position.X, newpart2.Position.Y, coord)
			elseif positiontype == 'all' then
				newpart2.Position = coord
			end
		end
	end
end)

function getProperties(inst : TextLabel?)
	local newbutton
	if inst.ClassName == 'TextLabel' then
		newbutton = Instance.new('TextButton')
	elseif inst.ClassName == 'TextButton' then
		newbutton = Instance.new('TextLabel')
	end
	local SelectionImageObject = inst.SelectionImageObject
	-- data
	local Archivable = inst.Archivable
	local Active = inst.Active
	local AnchorPoint = inst.AnchorPoint
	local AutomaticSize = inst.AutomaticSize
	local BackgroundColor3 = inst.BackgroundColor3
	local BackgroundTransparency = inst.BackgroundTransparency
	local BorderColor3 = inst.BorderColor3
	local BorderMode = inst.BorderMode
	local BorderSizePixel = inst.BorderSizePixel
	local LayoutOrder = inst.LayoutOrder
	local Position = inst.Position
	local Rotation = inst.Rotation
	local Size = inst.Size
	local SizeConstraint = inst.SizeConstraint
	local Visible = inst.Visible
	local ZIndex = inst.ZIndex
	-- behaviour
	local ClipsDescendants = inst.ClipsDescendants
	-- localization
	local AutoLocalize = inst.AutoLocalize
	local RootLocalizationTable = inst.RootLocalizationTable
	-- selection
	local NextSelectionDown = inst.NextSelectionDown
	local NextSelectionLeft = inst.NextSelectionLeft
	local NextSelectionRight = inst.NextSelectionRight
	local NextSelectionUp = inst.NextSelectionUp
	local Selectable = inst.Selectable
	local SelectionGroup = inst.SelectionGroup -- NEEDS CONDITION
	local SelectionOrder = inst.SelectionOrder
	-- text
	local FontFace = inst.FontFace
	local LineHeight = inst.LineHeight
	local MaxVisibleGraphemes = inst.MaxVisibleGraphemes
	local RichText = inst.RichText
	local Text = inst.Text
	local TextColor3 = inst.TextColor3
	local TextScaled = inst.TextScaled
	local TextSize = inst.TextSize
	local TextStrokeColor3 = inst.TextStrokeColor3
	local TextStrokeTransparency = inst.TextStrokeTransparency
	local TextTransparency = inst.TextTransparency
	local TextTruncate = inst.TextTruncate
	local TextWrapped = inst.TextWrapped
	local TextXAlignment = inst.TextXAlignment
	local TextYAlignment = inst.TextYAlignment
	
	local SelectionBehaviourDown
	local SelectionBehaviourLeft
	local SelectionBehaviourRight
	local SelectionBehaviourUp
	
	if SelectionGroup == true then
		SelectionBehaviourDown = inst.SelectionBehaviorDown
		SelectionBehaviourLeft = inst.SelectionBehaviorLeft
		SelectionBehaviourRight = inst.SelectionBehaviorRight
		SelectionBehaviourUp  = inst.SelectionBehaviorUp
	end
	
	newbutton.SelectionImageObject = SelectionImageObject
	newbutton.Archivable = Archivable
	newbutton.Active = Active
	newbutton.AnchorPoint = AnchorPoint
	newbutton.AutomaticSize = AutomaticSize
	newbutton.BackgroundColor3 = BackgroundColor3
	newbutton.BackgroundTransparency = BackgroundTransparency
	newbutton.BorderColor3 = BorderColor3
	newbutton.BorderMode = BorderMode
	newbutton.BorderSizePixel = BorderSizePixel
	newbutton.LayoutOrder = LayoutOrder
	newbutton.Parent = inst.Parent
	newbutton.Position = Position
	newbutton.Rotation = Rotation
	newbutton.Size = Size
	newbutton.SizeConstraint = SizeConstraint
	newbutton.Visible = Visible
	newbutton.ZIndex = ZIndex
	newbutton.ClipsDescendants = ClipsDescendants
	newbutton.AutoLocalize = AutoLocalize
	newbutton.RootLocalizationTable = RootLocalizationTable
	newbutton.NextSelectionUp = NextSelectionUp
	newbutton.NextSelectionLeft = NextSelectionLeft
	newbutton.NextSelectionRight = NextSelectionRight
	newbutton.NextSelectionDown = NextSelectionDown
	newbutton.Selectable = Selectable
	newbutton.SelectionGroup = SelectionGroup
	newbutton.SelectionOrder = SelectionOrder
	newbutton.FontFace = FontFace
	newbutton.LineHeight = LineHeight
	newbutton.MaxVisibleGraphemes = MaxVisibleGraphemes
	newbutton.RichText = RichText
	newbutton.Text = Text
	newbutton.TextColor3 = TextColor3
	newbutton.TextScaled = TextScaled
	newbutton.TextSize = TextSize
	newbutton.TextStrokeColor3 = TextStrokeColor3
	newbutton.TextStrokeTransparency = TextStrokeTransparency
	newbutton.TextTransparency = TextTransparency
	newbutton.TextTruncate = TextTruncate
	newbutton.TextWrapped = TextWrapped
	newbutton.TextXAlignment = TextXAlignment
	newbutton.TextYAlignment = TextYAlignment
	
	if newbutton.SelectionGroup == true then
		newbutton.SelectionBehaviorDown = SelectionBehaviourDown
		newbutton.SelectionBehaviorLeft = SelectionBehaviourLeft
		newbutton.SelectionBehaviorRight = SelectionBehaviourRight
		newbutton.SelectionBehaviorUp  = SelectionBehaviourUp
	end

	getChildren(inst, newbutton)
end

function getChildren(firstinstance: TextLabel?, secondinstance: TextButton?)
	for i,v in pairs(firstinstance:GetChildren()) do
		local child = v:Clone()
		child.Parent = secondinstance
	end
end


function onNewScriptButtonClicked()
	local selectedObjects = Selection:Get()
	local parent
	if #selectedObjects > 0 then
		if selectedObjects[1].ClassName == 'TextLabel' or selectedObjects[1].ClassName == 'TextButton' then
			print('attempting')
			parent = selectedObjects[1]
			getProperties(parent)
		else
			warn('please select a textlabel or textbutton!')
		end
	else
		warn('please select a button or label to convert!')
	end
	ChangeHistoryService:SetWaypoint("Started conversion of a label")
end

function getPosition(typee)
	local so = Selection:Get()
	local part
	if #so > 0 then
		part = so[1]
		if typee == 'X' then
			coord = part.Position.X
		elseif typee == 'Y' then
			coord = part.Position.Y
		elseif typee == 'Z' then
			coord = part.Position.Z
		elseif typee == 'all' then
			coord = part.Position
		end
	end
	print('select another part')
	checkselection = true
end

buttontolabel.Click:Connect(onNewScriptButtonClicked)

positionx.Click:Connect(function()
	getPosition('X')
	positiontype = 'X'
end)

positiony.Click:Connect(function()
	getPosition('Y')
	positiontype = 'Y'
end)

positionz.Click:Connect(function()
	getPosition('Z')
	positiontype = 'Z'
end)

copyall.Click:Connect(function()
	getPosition('all')
	positiontype = 'all'
end)
