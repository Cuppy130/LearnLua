local function createPoint(x, y)
    return {x = x, y = y, __tostring = function(self)
        return "(" .. self.x .. ", " .. self.y .. ")"
    end}
end
local function slope(point1, point2)
    if point1.x == point2.x then
        return nil -- vertical line
    end
    return (point2.y - point1.y) / (point2.x - point1.x)
end
local function pointSlopeForm(point, slope)
    if slope == nil then
        return "x = " .. point.x -- vertical line
    end
    return "y - " .. point.y .. " = " .. slope .. "(x - " .. point.x .. ")"
end

-- Example usage
local point1 = createPoint(2, 3)
local point2 = createPoint(4, 7)
local m = slope(point1, point2)
local lineEquation = pointSlopeForm(point1, m)
print("Point 1: " .. point1.__tostring(point1))
print("Point 2: " .. point2.__tostring(point2))
print("Slope: " .. (m or "undefined"))
print("Point-Slope Form: " .. lineEquation)