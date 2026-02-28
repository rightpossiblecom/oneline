# OneLine - Release Credentials

## ⚠️ CRITICAL SECURITY NOTICE

**This folder contains sensitive signing credentials for the Google Play Store. Keep it secure!**

### Files
- `oneline-release.jks` - Android signing keystore
- `key.properties` - Keystore credentials
- `play_store_listing.txt` - Play Store metadata
- `PRIVACY_POLICY.md` - Privacy policy
- `screenshots/` - App screenshots (add before store submission)
- `featured_graphic_oneline.png` - Play Store feature graphic 1024×500 (create before store submission)

### Signing Credentials

**Keystore Details:**
- File: `oneline-release.jks`
- Store Password: `oneline123`
- Key Alias: `oneline`
- Key Password: `oneline123`
- Validity: 10,000 days

### Setup Instructions for Development

1. **Copy keystore to android/app/**
   ```bash
   cp oneline-release.jks ../../../android/app/
   ```

2. **Copy key.properties to android/**
   ```bash
   cp key.properties ../../../android/
   ```

3. **Verify build configuration in `android/app/build.gradle.kts`**
   - Should have signing config setup
   - Release build type should use `com.oneline.app` package ID

### Building Release APK/AAB

**Build AAB for Play Store:**
```bash
flutter build appbundle --release
```

**Build APK for testing:**
```bash
flutter build apk --release
```

**Output paths:**
- AAB: `build/app/outputs/bundle/release/app-release.aab`
- APK: `build/app/outputs/apk/release/app-release.apk`

### Important Notes

1. **Never commit this file to public repositories**
2. **Backup this keystore securely** - Losing it means you can't update the app
3. **Keep passwords secure** - Only share via encrypted channels
4. **The SHA-1 fingerprint is used in Google Play Console**

To get SHA-1 fingerprint:
```bash
keytool -list -v -keystore oneline-release.jks -alias oneline -storepass oneline123 -keypass oneline123
```

### Play Store Upload

1. Go to [Google Play Console](https://play.google.com/console)
2. Create new app or select OneLine
3. Select **Release > Production**
4. Upload the AAB file
5. Fill in release notes
6. Submit for review

---

**Generated:** February 27, 2026
**App:** OneLine v1.0.0
