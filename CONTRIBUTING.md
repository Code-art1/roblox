# Contributing to Ultimate Roblox Hub

Thank you for your interest in contributing to Ultimate Roblox Hub! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Reporting Bugs
1. **Check existing issues** to avoid duplicates
2. **Use the bug report template** when creating new issues
3. **Provide detailed information** including:
   - Roblox game name and place ID
   - Executor used
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots/videos if applicable

### Suggesting Features
1. **Check existing feature requests** to avoid duplicates
2. **Use the feature request template**
3. **Explain the use case** and why it would be beneficial
4. **Consider implementation complexity** and compatibility

### Code Contributions

#### Getting Started
1. **Fork the repository**
2. **Create a feature branch** from `main`
3. **Make your changes** following our coding standards
4. **Test thoroughly** on multiple games/executors
5. **Submit a pull request** with detailed description

#### Coding Standards

##### Lua Style Guide
```lua
-- Use descriptive variable names
local playerCharacter = player.Character
local targetPosition = target.Position

-- Use proper indentation (4 spaces)
if condition then
    doSomething()
    if nestedCondition then
        doSomethingElse()
    end
end

-- Comment complex logic
-- Calculate predicted position based on velocity and distance
local predictedPosition = targetPosition + (velocity * timeToTarget)

-- Use meaningful function names
local function isPlayerValid(targetPlayer)
    return targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
end
```

##### File Structure
```
src/
├── features/
│   ├── aimbot.lua          # Aimbot system
│   ├── esp.lua             # ESP system
│   ├── movement.lua        # Movement features
│   └── misc.lua            # Miscellaneous features
├── ui/
│   ├── components.lua      # UI components
│   ├── themes.lua          # Theme system
│   └── windows.lua         # Window management
├── utils/
│   ├── math.lua            # Math utilities
│   ├── player.lua          # Player utilities
│   └── security.lua        # Security functions
└── games/
    ├── arsenal.lua         # Arsenal-specific features
    ├── phantom-forces.lua  # Phantom Forces features
    └── universal.lua       # Universal game support
```

#### Documentation Standards
- **Comment all public functions** with purpose and parameters
- **Use JSDoc-style comments** for complex functions
- **Update README.md** for new features
- **Add examples** for new API functions

```lua
--[[
    Calculates the predicted position of a moving target
    
    @param targetPlayer Player - The target player object
    @param predictionFactor number - Prediction multiplier (0-1)
    @return Vector3 - Predicted position
--]]
local function predictTargetPosition(targetPlayer, predictionFactor)
    -- Implementation here
end
```

## 🔧 Development Setup

### Prerequisites
- **Roblox Studio** for testing
- **Compatible executor** (Synapse X, Script-Ware, etc.)
- **Git** for version control
- **Text editor** with Lua syntax highlighting

### Local Development
1. **Clone the repository**
   ```bash
   git clone https://github.com/ultimate-team/roblox-hub.git
   cd roblox-hub
   ```

2. **Create a development branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Edit files in the `src/` directory
   - Test changes in Roblox Studio or with an executor
   - Ensure compatibility across different games

4. **Test thoroughly**
   - Test on multiple games
   - Test with different executors
   - Verify no performance issues
   - Check for memory leaks

## 🧪 Testing Guidelines

### Manual Testing
- **Test core features** (aimbot, ESP, movement)
- **Test UI responsiveness** on different screen sizes
- **Test theme switching** and customization
- **Test error handling** with invalid inputs
- **Test performance** with many players

### Game Compatibility Testing
Test your changes on these priority games:
1. **Arsenal** - Primary testing game
2. **Phantom Forces** - FPS mechanics
3. **Bad Business** - Alternative FPS
4. **Jailbreak** - Open world testing
5. **Adopt Me** - High player count testing

### Performance Testing
- **Monitor FPS impact** during usage
- **Check memory usage** over time
- **Test with 20+ players** in server
- **Verify smooth animations** and transitions

## 📝 Pull Request Process

### Before Submitting
- [ ] **Code follows style guidelines**
- [ ] **All tests pass**
- [ ] **Documentation is updated**
- [ ] **No breaking changes** (or properly documented)
- [ ] **Performance impact is minimal**

### PR Description Template
```markdown
## Description
Brief description of changes made.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested on Arsenal
- [ ] Tested on Phantom Forces
- [ ] Tested with Synapse X
- [ ] Tested with Krnl
- [ ] Performance tested

## Screenshots/Videos
If applicable, add screenshots or videos demonstrating the changes.

## Additional Notes
Any additional information or context.
```

### Review Process
1. **Automated checks** must pass
2. **Code review** by maintainers
3. **Testing verification** on multiple games
4. **Documentation review** if applicable
5. **Final approval** and merge

## 🏷️ Release Process

### Version Numbering
We use semantic versioning (MAJOR.MINOR.PATCH):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Checklist
- [ ] **Version number updated** in all relevant files
- [ ] **Changelog updated** with new features/fixes
- [ ] **Documentation updated** if needed
- [ ] **Compatibility tested** across games
- [ ] **Performance benchmarked**

## 🎯 Feature Priorities

### High Priority
- **Security improvements** and anti-detection
- **Performance optimizations**
- **Bug fixes** for existing features
- **Game compatibility** improvements

### Medium Priority
- **New aimbot features** (prediction, smoothing)
- **ESP enhancements** (new display options)
- **UI improvements** (themes, animations)
- **Mobile optimization**

### Low Priority
- **Experimental features**
- **Game-specific modules**
- **Advanced customization options**

## 🛡️ Security Guidelines

### Code Security
- **Never include** personal information or credentials
- **Validate all inputs** to prevent exploits
- **Use secure random** for anti-detection features
- **Avoid hardcoded** sensitive values

### Anti-Detection
- **Randomize timing** for automated actions
- **Implement human-like** movement patterns
- **Use safe default values** for all features
- **Provide warnings** for risky settings

## 📞 Getting Help

### Communication Channels
- **Discord**: Join our development server
- **GitHub Issues**: For bug reports and feature requests
- **GitHub Discussions**: For general questions and ideas
- **Email**: development@ultimatehub.dev

### Mentorship
New contributors can request mentorship from experienced team members. We're happy to help you get started!

## 🏆 Recognition

Contributors will be recognized in:
- **README.md** contributors section
- **Release notes** for significant contributions
- **Discord** special roles for active contributors
- **Annual contributor** highlights

## 📄 License

By contributing to Ultimate Roblox Hub, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to Ultimate Roblox Hub! Together, we can build the best Roblox script hub available. 🚀
