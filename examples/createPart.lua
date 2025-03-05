local workspace = game.workspace
local part = Instance.new("Part")
part.Size = Vector3.new(4, 1, 2)
part.Position = Vector3.new(0, 5, 0)
part.Anchored = true
part.BrickColor = BrickColor.new("Bright red")
part.Material = Enum.Material.SmoothPlastic
part.Parent = workspace
part.Name = "MyPart"

part.Touched:Connect(function(hit)
    if hit:IsA("Player") then
        part.BrickColor = BrickColor.Random()
    end
end)