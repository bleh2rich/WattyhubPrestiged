local part1 = Instance.new("Part")
part1.Size = Vector3.new(25.5, 1, 16.5)
part1.CFrame = CFrame.new(425.841675, 38.4094162, 314.179718, 1, 0, 0, 0, 1, 0, 0, 0, 1)
part1.Anchored = true
part1.Parent = workspace
part1.Transparency = 0 


local part2 = Instance.new("Part")
part2.Size = Vector3.new(2.4, 15.4, 15.1)
part2.CFrame = CFrame.new(445.961884, 32.9749565, 315.502991, 0.35819906, -0.933054566, -0.0332056209, 0.933569551, 0.358396351, 9.89250839e-06, 0.0118915439, -0.0310032982, 0.999448538)
part2.Anchored = true
part2.Parent = workspace
part2.Transparency = 0 


local part3 = Instance.new("Part")
part3.Size = Vector3.new(25.25, 25, 0.5)
part3.CFrame = CFrame.new(401.914307, 42.6595383, 307.790344, 1, 0, 0, 0, 0, -1, 0, 1, 0)
part3.Anchored = true
part3.Parent = workspace
part3.Transparency = 0 


local jail = workspace.Jail

local function deleteHandles(object)
    for _, child in ipairs(object:GetChildren()) do
        if child.Name == "Handle" then
            child:Destroy()
        elseif #child:GetChildren() > 0 then
            deleteHandles(child) 
        end
    end
end

deleteHandles(jail)
