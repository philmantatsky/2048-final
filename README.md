# 2048 — Swift iOS Clone

This is a native iOS implementation of the classic **2048** puzzle game, built entirely from scratch in Swift.

The app challenges users to combine matching numbered tiles on a 4×4 grid, doubling their values with each merge, with the goal of reaching the elusive 2048 tile.

I built it using **Swift** and **UIKit** in **Xcode**, designing the interface with Auto Layout and handling user input through `UISwipeGestureRecognizer` for fluid gesture controls.

The core game logic is structured around a 2D array that represents the board, with each swipe triggering a sequence of direction transformation, tile compression, scoring, and new tile spawning.

Along the way I worked through tricky bugs around chained merges and deadlock detection, and iterated on UI polish — spacing, typography, and animations — based on feedback from tech professionals I presented the project to.

The result is a smooth, responsive 60 FPS game that feels native to iOS.

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![Platform](https://img.shields.io/badge/Platform-iPhone-lightgrey.svg)
---

## ✨ Features

- **Smooth 60 FPS gameplay** — tile movements and merges feel responsive and natural
- **Swipe gesture controls** — intuitive up/down/left/right swipes powered by `UISwipeGestureRecognizer`
- **Accurate scoring system** — tracks current score and persists high score across sessions
- **Clean, minimal UI** — designed to feel native to iOS with proper spacing, typography, and color contrast
- **Game-over detection** — recognizes when no valid moves remain and prompts a restart

---

## 🛠️ How It Works

The game logic is built around a 4×4 grid represented as a 2D array. Each swipe triggers:

1. **Direction transformation** — the board is rotated so all moves can be processed as a "slide left"
2. **Tile compression** — empty spaces are removed and adjacent equal tiles are merged
3. **Score update** — merged tile values are added to the running score
4. **New tile spawn** — a 2 or 4 appears in a random empty cell
5. **Win/loss check** — the board is scanned for a 2048 tile or a deadlock state

This approach keeps the merge logic simple and reusable across all four directions.

---

## 🚀 Getting Started

### Requirements
- macOS with Xcode 14 or later
- iOS 15.0+ Simulator or physical device

### Run it locally

```bash
git clone https://github.com/philmantatsky/2048-swift.git
cd 2048-swift
open 2048.xcodeproj
```

Then hit **▶ Run** in Xcode and pick a simulator (iPhone 14 works great).

---

## 📚 What I Learned

- Building responsive UIs in **UIKit** with Auto Layout and gesture recognizers
- Animating view transitions cleanly using `UIView.animate`
- Structuring game state separately from view code (closer to MVC)
- Handling edge cases in grid logic — chained merges, blocked moves, deadlock detection
- Presenting the project to tech professionals and iterating on their UI/code feedback

---

## 🔮 Future Improvements

- [ ] Undo button (one-step rewind)
- [ ] Custom themes / dark mode
- [ ] Animated tile-spawn effects
- [ ] iPad layout support
- [ ] Haptic feedback on merges

---

## 👤 Author

**Phillip Mantatsky**
B.S. Computer Science @ University of Illinois at Chicago
[LinkedIn](https://www.linkedin.com/in/philmantatsky) · [GitHub](https://github.com/philmantatsky)
