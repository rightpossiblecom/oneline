# Screenshot Requirements for OneLine

## Required Screenshots for Google Play Store

### Format Specifications
- Minimum 2 screenshots required
- Recommended 8 screenshots for best visibility
- Resolution: 1080 x 1920 pixels (9:16 aspect ratio)
- Format: PNG or JPEG
- File size: Less than 8 MB each

### Screenshot Content Guide

#### Screenshot 1: Main Gameplay
- Show level 1-2 in progress
- Display dots on canvas
- Show current level number
- Include reset button
- Demonstrate the tap mechanic

#### Screenshot 2: Level Progress
- Show a mid-difficulty level (level 10-15)
- Show progress counter (e.g., 5/8 dots)
- Demonstrate more complex dot patterns

#### Screenshot 3: Level Complete
- Show the success screen
- Display "Perfect!" badge if available
- Show "Next Level" button

#### Screenshot 4: Settings Screen
- Display theme toggle (Light/Dark)
- Show sound and haptic controls
- Include version information

#### Screenshot 5: Advanced Level
- Show complex puzzle (level 20+)
- Demonstrate intricate dot patterns
- Show high difficulty level counter

#### Screenshot 6: Perfect Badge Achievement
- Show level completion with "Perfect!" badge
- Emphasize the achievement mechanic

#### Screenshot 7: Dark Mode
- Demonstrate dark theme appearance
- Same gameplay content as Screenshot 1-2

#### Screenshot 8: Home Screen
- Show main menu
- Display current level indicator
- Show Play, Settings, About buttons

## Localization

Consider providing screenshots in multiple languages:
- English (required)
- Spanish
- French
- German
- Japanese
- Portuguese

## Feature Graphic

- **Resolution:** 1024 x 500 pixels
- **Format:** PNG or JPEG
- **Content:** Eye-catching game artwork with "OneLine" title
- **Should include:** Game name, key feature, visual appeal

### Recommended Design Elements
- Clean, minimalist style matching app theme
- Emerald/green accent color (#10B981)
- Show 3-4 dots connected with a line
- Include app name in bold typography
- "Connect. One line. One touch." tagline

## File Organization

Save all screenshots in:
```
docs/release/screenshots/
├── phone_screenshot_1.png
├── phone_screenshot_2.png
├── ...
├── phone_screenshot_8.png
├── tablet_screenshot_1.png (optional)
├── tablet_screenshot_2.png (optional)
└── featured_graphic_oneline.png
```

### Submission to Play Store

1. In Google Play Console, go to **Appearance > App content**
2. Upload phone screenshots (minimum 2, recommended 8)
3. Upload feature graphic
4. Upload tablet screenshots (optional)
5. Ensure all images meet size/format requirements
6. Preview how it looks to users

## Tips

- Use real device screenshots with good lighting
- Ensure text is readable in thumbnails
- Avoid clutter - keep focus on gameplay
- Use consistent background and styling
- Show variety of gameplay levels
- Highlight key features in visuals

---

**Note:** Screenshots are currently a manual task. They need to be captured from the running app on Android and iOS devices.

To create screenshots:
1. Run: `flutter run`
2. Navigate through each screen
3. Use device screenshot functionality
4. Crop to 1080x1920 if needed
5. Save to screenshots folder
