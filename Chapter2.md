# Chapter 2: Functions & Events
## 1.1.1 Functions
Functions are reusable blocks of code that perform a specific task. In Roblox Lua, functions can be defined using the `function` keyword, followed by the function name and parentheses. For example:
```lua
function myFunction()
    print("Hello, World!")
end
```
You can call a function by using its name followed by parentheses:
```lua
myFunction() -- Output: Hello, World!
```

## 1.1.2 Function Parameters
Functions can accept parameters, which are values passed to the function when it is called. You can define parameters by including them in the parentheses when defining the function. For example:
```lua
function greet(name)
    print("Hello, " .. name .. "!")
end
greet("Alice") -- Output: Hello, Alice!
```
You can also define default values for parameters by assigning them a value in the function definition:
```lua
function greet(name, greeting)
    name = name or "World" -- Default value for name is "World" if not provided
    greeting = greeting or "Hello" -- Default value for greeting is "Hello" if not provided
    print(greeting .. ", " .. name .. "!")
end

greet("Alice", "Hi") -- Output: Hi, Alice!
greet("Bob") -- Output: Hello, Bob!
greet() -- Output: Hello, World!
```

## 1.1.3 Return Values
Functions can return values using the `return` keyword. You can return multiple values by separating them with commas. For example:
```lua
function add(a, b)
    -- Set default values for parameters
    a = a or 0
    b = b or 0

    -- Perform addition
    local sum = a + b
    return sum -- Return the value of sum
end

result = add(5, 3) -- result is now 8
print(result) -- Output: 8
```

## 1.1.4 Anonymous Functions
Anonymous functions are functions that do not have a name. They can be assigned to variables or passed as arguments to other functions. For example:
```lua
myFunction = function(x, y)
    return x + y
end
result = myFunction(5, 3) -- result is now 8
print(result) -- Output: 8
```

Anonymous functions are often used as callbacks in event handling or when passing functions as arguments to other functions.

```lua
function performOperation(a, b, operation)
    return operation(a, b)
end
result = performOperation(5, 3, function(x, y)
    return x + y
end)
print(result) -- Output: 8
```

## 1.1.5 Closures
Closures are functions that capture the environment in which they were created. This means that they can access variables from their parent scope even after that scope has finished executing. For example:
```lua
function createCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end
counter = createCounter()
print(counter()) -- Output: 1
print(counter()) -- Output: 2
print(counter()) -- Output: 3
```

In this example, the `createCounter` function returns an anonymous function that increments and returns the `count` variable. Each time you call `counter()`, it retains access to the `count` variable from its parent scope.

## 1.1.6 Higher-Order Functions
Higher-order functions are functions that can take other functions as arguments or return functions as their result. This allows for powerful abstractions and functional programming techniques. For example:

```lua
function map(array, func)
    local result = {}
    for i, v in ipairs(array) do
        result[i] = func(v)
    end
    return result
end
numbers = {1, 2, 3, 4, 5}
squaredNumbers = map(numbers, function(x)
    return x * x
end)
for i, v in ipairs(squaredNumbers) do
    print(v) -- Output: 1, 4, 9, 16, 25
end
```

In this example, the `map` function takes an array and a function as arguments. It applies the function to each element of the array and returns a new array with the results.

## 1.1.7 Recursion
Recursion is a programming technique where a function calls itself to solve a problem. It is often used to solve problems that can be broken down into smaller subproblems. For example, calculating the factorial of a number using recursion:
```lua
function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end
result = factorial(5) -- result is now 120
print(result) -- Output: 120
```

In this example, the `factorial` function calls itself with a decremented value of `n` until it reaches the base case of `n == 0`, at which point it returns 1.

## 1.1.8 Variable Scope
Variable scope refers to the visibility and lifetime of variables in a program. In Lua, there are two types of variable scope: global and local.
- **Global Variables**: Global variables are accessible from anywhere in the program. They are defined outside of any function and can be modified by any part of the code.
- **Local Variables**: Local variables are only accessible within the block of code in which they are defined. They are created using the `local` keyword and are destroyed when the block of code finishes executing.
```lua
function myFunction()
    local localVar = "I am local"
    print(localVar) -- Output: I am local
end
myFunction()
print(localVar) -- Output: nil
```
In this example, `localVar` is a local variable defined within the `myFunction` function. It is accessible within the function but not outside of it.

## 1.1.9 Function Overloading
Function overloading is a feature that allows you to define multiple functions with the same name but different parameter types or numbers. Lua does not support function overloading directly, but you can achieve similar functionality by using variable arguments or checking the types of the arguments within the function.
```lua
function add(a, b)
    if type(a) == "number" and type(b) == "number" then
        return a + b
    elseif type(a) == "string" and type(b) == "string" then
        return a .. b
    else
        error("Invalid arguments")
    end
end

print(add(5, 3)) -- Output: 8
print(add("Hello, ", "World!")) -- Output: Hello, World!
print(add(5, "Hello")) -- Output: error: Invalid arguments
```
In this example, the `add` function checks the types of its arguments and performs different operations based on their types.

## 1.1.10 Function Documentation
Documenting your functions is important for maintaining code readability and understanding. You can use comments to describe the purpose of the function, its parameters, and its return values. For example:
```lua
--[[
    Function: add
    Description: Adds two numbers or concatenates two strings.
    Parameters:
        a (number|string): The first value.
        b (number|string): The second value.
    Returns:
        number|string: The sum of the two numbers or the concatenation of the two strings.
]]
function add(a, b)
    if type(a) == "number" and type(b) == "number" then
        return a + b
    elseif type(a) == "string" and type(b) == "string" then
        return a .. b
    else
        error("Invalid arguments")
    end
end
-- Example usage
print(add(5, 3)) -- Output: 8
print(add("Hello, ", "World!")) -- Output: Hello, World!
-- print(add(5, "Hello")) -- Output: error: Invalid arguments
```

In this example, the function documentation provides a clear description of the function's purpose, parameters, and return values. This helps other developers (and your future self) understand how to use the function correctly.

## 1.1.11 Function Best Practices
- Use descriptive names for functions and parameters to make the code self-explanatory.
- Keep functions small and focused on a single task. This makes them easier to read, test, and maintain.
- Avoid using global variables within functions unless necessary. Use local variables to limit the scope of variables.
- Document your functions with comments to explain their purpose and usage.
- Use consistent naming conventions for functions and parameters to improve code readability.
- Test your functions thoroughly to ensure they work as expected and handle edge cases.
- Use error handling to manage unexpected situations gracefully.
- Consider using higher-order functions and closures to create more flexible and reusable code.
- Avoid deep nesting of functions to improve code readability.
- Use recursion judiciously, as it can lead to stack overflow errors if not handled properly.

## 1.2 Events
Events are a fundamental part of Roblox Lua programming. They allow you to respond to user actions, game state changes, and other occurrences in your game. Events are typically associated with objects in the game, such as buttons, players, or parts.

## 1.2.1 Event Listeners
Event listeners are functions that are called when a specific event occurs. You can connect an event listener to an event using the `Connect` method. For example, if you want to respond to a player joining the game, you can use the `PlayerAdded` event in the `Players` service:
```lua
local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(player)
    print(player.Name .. " has joined the game!")
end)
```
In this example, the `PlayerAdded` event is connected to an anonymous function that prints a message when a player joins the game.

## 1.2.2 Event Parameters
Event listeners can accept parameters that provide additional information about the event. For example, the `Touched` event of a part provides information about the object that touched it:
```lua
local part = game.Workspace.Part
part.Touched:Connect(function(otherPart)
    print(otherPart.Name .. " touched the part!")
end)
```

In this example, the `Touched` event is connected to a function that prints the name of the object that touched the part.

## 1.2.3 Disconnecting Events
You can disconnect an event listener using the `Disconnect` method. This is useful when you no longer need to respond to an event or when you want to prevent memory leaks. For example:
```lua
local function onPlayerAdded(player)
    print(player.Name .. " has joined the game!")
end
local connection = Players.PlayerAdded:Connect(onPlayerAdded)
-- Later, when you want to disconnect the event listener
connection:Disconnect()
```
In this example, the `onPlayerAdded` function is connected to the `PlayerAdded` event, and later it is disconnected using the `Disconnect` method.
## 1.2.4 Event Debouncing
Event debouncing is a technique used to prevent multiple rapid calls to an event listener. This is useful for events that can be triggered multiple times in quick succession, such as button clicks or player movements. You can implement debouncing by using a flag to track whether the event listener is currently active:
```lua
local button = game.Workspace.Button
local isDebouncing = false
button.ClickDetector.MouseClick:Connect(function(player)
    if not isDebouncing then
        isDebouncing = true
        print(player.Name .. " clicked the button!")
        wait(1) -- Wait for 1 second before allowing the next click
        isDebouncing = false
    end
end)
```
In this example, the `isDebouncing` flag is used to prevent multiple clicks on the button within a 1-second interval.

## 1.2.5 Event Filtering
Event filtering is a technique used to limit the events that trigger an event listener based on certain conditions. This can help improve performance and reduce unnecessary function calls. For example, you can filter events based on the type of object that triggered the event:
```lua
local part = game.Workspace.Part
part.Touched:Connect(function(otherPart)
    if otherPart:IsA("Player") then
        print(otherPart.Name .. " touched the part!")
    end
end)
```
In this example, the event listener only responds to touches from objects that are of type "Player". This can help reduce the number of function calls and improve performance.

## 1.2.6 Event Best Practices
- Use descriptive names for event listeners to make the code self-explanatory.
- Keep event listeners small and focused on a single task. This makes them easier to read, test, and maintain.
- Avoid using global variables within event listeners unless necessary. Use local variables to limit the scope of variables.
- Document your event listeners with comments to explain their purpose and usage.
- Use consistent naming conventions for event listeners and parameters to improve code readability.
- Test your event listeners thoroughly to ensure they work as expected and handle edge cases.
- Use error handling to manage unexpected situations gracefully.
- Consider using event filtering to limit the events that trigger an event listener based on certain conditions.
- Use event debouncing to prevent multiple rapid calls to an event listener.
- Disconnect event listeners when they are no longer needed to prevent memory leaks.
- Avoid deep nesting of event listeners to improve code readability.

## Conclusion
In this chapter, we covered the basics of functions and events in Roblox Lua programming. Functions are reusable blocks of code that perform specific tasks, while events allow you to respond to user actions and game state changes. Understanding how to create and use functions and events is essential for building interactive and dynamic games in Roblox.
By following best practices for functions and events, you can create clean, efficient, and maintainable code that enhances the player experience in your games. In the next chapter, we will explore the Roblox API and how to use it to create a simple game.