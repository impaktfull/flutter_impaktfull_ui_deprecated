# 0.0.30

## Feat

- ImpaktfullInputField has a title

## Docs

- Updated readme

# 0.0.29

## Feat

- `extraPadding` added to ImpaktfullListView

# 0.0.28

## Feat

- Added `margin` & `padding` to the ImpaktfullCard

# 0.0.27

## Fix

- ImpaktfullSwitch & ImpaktfullCheckbox with the turned off state (accent1TurnedOffState)

# 0.0.26

## Feat

- Check if leadingAsset is an icon or an image so a color should be a applied or not (on ImpaktfullListItem & ImpaktfullSelectableListItem)

# 0.0.25

## Feat

- ImpaktfullTheme added `listViewTitleHorizontalPadding` && `listViewTitleVerticalPadding` to better control the padding of the title in the ImpaktfullListView

# 0.0.24

## Feat

- ImpaktfullCard has now an `onTap` parameter

# 0.0.23

## Feat

- ImpaktfullTheme expose the defaultSplashFactory
- RTL & LTR support for ImpaktfullApp (detection by the locale param)

# 0.0.22

## Feat

- ImpaktfullApp now exposes `snackyController` to set a custom snackyController

# 0.0.21

## Feat

- ImpaktfullApp now exposes `snackyBuilder` to set a custom snakcyBuilder

# 0.0.20

## Feat

- Readme added pub.dev badge
- Example better icons & assets
- Added ImpaktfullCard
- Added ImpaktfullDialog
- Added ImpaktfullFab
- Added ImpaktfullPagination
- Added ImpaktfullScreen
- ImpaktfullBottomNavigationItem supports selected icon assets
- ImpaktfullListView refresh action & loading state
- ImpaktfullListView pull to refresh
- ImpaktfullRefreshIndicator
- ImpaktfullApp now supports showing or hiding the debugFlag
- ImpaktfullButton can have a loading state with `onAsyncTap`
- ImpaktfullTouchFeedback now has actual feedback based on the platform
- ImpaktfullTheme now has more shadow options (`card`, `selectedCard`, `bottomNavigation`, `button`)
- ImpaktfullTheme now has border options (`card`, `selectedCard`)

## Fix
- ImpaktfullDatePicker now uses the borderRadius from the theme
- Small disposed errors in ImpaktfullListItem

# 0.0.18 - 0.0.19

## Fix

- Snacky config to use the correct colors

# 0.0.17

## Feat

- Added ImpaktfullRadioButtonListItem

# 0.0.16

## Fix

- Version bump intl

# 0.0.15

## Feat

- Added ImpaktfullDateTimePickerDialog
- Added ImpaktfullDateTimeRangePicker
- Added ImpaktfullDialog

# 0.0.14

## Feat

- Added ImpaktfullRadioButton
- Added ImpaktfullDatePicker
- Added ImpaktfullTimePicker
- Added ImpaktfullCheckbox
- Added ImpaktfullDateTimePicker
- Added borderWidth to ImpaktfullTheme.ImpaktfullDimens

## Fix

- ImpaktfullSwitchListItem removed isSelected

# 0.0.13

## Fix

- Bug in ImpaktfullListItem where trailing widget was not shown correctly

# 0.0.12

## Feat

- ImpaktfullSwitch & ImpaktfullSwitchListItem added

# 0.0.11

## Fix

- Assets not loading in Android

# 0.0.10

## Fix

- SvgIcon pixelated (because of flutter_svg/Impeller bug)

# 0.0.9

## Fix

- Documentation
- obscureText on ImpaktfullInputField

# 0.0.8

## Fix

- ImpaktfullNavBar height & moved to a new component

# 0.0.7

## Feat

- ImpaktfullTabBar & ImpaktfullTabBarItem added

# 0.0.6

## Feat

- ImpaktfullInputField added

# 0.0.5

## Feat

- ImpaktfullBottomNavigationItem & ImpaktfullBottomNavigation added

# 0.0.4

## Fix

- ImpaktfullApp fixed required home widget (now optional)
- ImpaktfullApp fixed has now the option to override the material themeing

# 0.0.3

## Feat

- Added a couple new components:

```
    ImpaktfullListItem
    ImpaktfullListItemTitle
    ImpaktfullSelectableListItem
    ImpaktfullSeparatedColumn
```

- Added a couple new default icons:

```
    assets/icons/check.svg
    assets/icons/chevron_right.svg
```

- Added support for custom durations 

## Refactor

- Some onCard is now onCardPrimary and we added onCardSecondary

# 0.0.2

## Feat

- Github actions for CI/CD

# 0.0.1

## Feat

- Initial release