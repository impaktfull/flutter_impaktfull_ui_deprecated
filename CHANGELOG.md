# 0.0.34

## Fix

- Separated column uses correct border radius again

# 0.0.33

## Update

- Updated readme with disclaimer everything under <1.0.0 should not be used unless you want to test it

# 0.0.32

## Breaking

- ImpaktfullDialog `isPrimaryDange` => `primaryButtonType = ImpaktfullDialogPrimaryButtonType.danger`

## Feat

- TextStyleExtension added `withOpacity()` method to override the color opacity
- ImpaktfullButton now has an `onAccent` property to flag a secondary button that it is shown on an accent color
- ImpaktfullCheckbox now has the option to override the colors
- ImpaktfullSwitch now has the option to override the colors
- ImpaktfullDialog added `padding` & `margin`
- ImpaktfullListItem added `padding`
- ImpaktfullSimpleListItem added `padding` & `spacing`
- ImpaktfullSwitchListItem added `padding` & `spacing`
- ImpaktfullListView.child added to have a listview with a child instead of children
- ImpaktfullLoadingIndicator added `custom` constructor where we can pass an `asset` (lottie file asset path)
- ImpaktfullNavBar added option to mark a navbar as `isFullScreen`
- ImpaktfullNavBar title nullable to hide the title
- ImpaktfullScreen added option to mark a navbar as `isFullScreen`
- ImpaktfullScreen title nullable to hide the title
- ImpaktfullSeparatedColumn added 2 options: `showFirstSeparator` & `showLastSeparator` to control the visibility of the separators for the first & last item

## Fix

- ImpaktfullNavBarAction use correct color for the icon

# 0.0.31

## Feat

- Added ImpaktfullBottomSheet
- Added ImpaktfullSimpleListItem
- Added ImpaktfullIconButton
- ImpaktfullInputField has a title
- Theme: Added close icon 
- Theme: Added danger color
- ImpaktfullScreen: tap outside to unfocus
- ImpaktfullSwitch made onChanged optional to make it a read-only switch
- ImpaktfullSwitchListItem made onChanged optional to make it a read-only switchListItem
- ImpaktfullListItemTitle added option to set textAlign
- ImpaktfullListItemTitle added danger option
- ImpaktfullDialog primary action can be danger action
- ImpaktfullButton added danger option
- ImpaktfullAutoLayout added maiinAxisSize

## Fix

- ImpaktfullAutoLayout removed padding & backgroundColor

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