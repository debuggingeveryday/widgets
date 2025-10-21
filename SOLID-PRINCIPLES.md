# SOLID Principles Applied to EWW Widgets

This document explains how SOLID principles have been applied to refactor the EWW widget system for better maintainability, extensibility, and code quality.

## Overview

The original EWW configuration had several issues:
- Mixed responsibilities in components
- Hard to extend without modifying existing code
- Inconsistent widget interfaces
- Tight coupling between data sources and presentation

## SOLID Principles Implementation

### 1. Single Responsibility Principle (SRP)

**Before**: Components mixed data fetching, styling, and presentation
```yuck
(defwidget music []
  (box :class "music" :orientation "h"
    (eventbox :onclick `scripts/music/toggle_track.sh`
      (box :orientation "h"
        (label :text {music != "" ? "󰲸" : "󰎊"})
        (label :text music)
      )
    )
  )
)
```

**After**: Each component has one responsibility
```yuck
;; Data Provider - Only responsible for data
(defvar music-data {
  :icon {music-status != "" ? "󰲸" : "󰎊"}
  :value music-status
  :class "music"
})

;; Widget - Only responsible for presentation
(defwidget music-widget []
  (base-system-widget music-data)
)
```

### 2. Open/Closed Principle (OCP)

**Before**: Adding new widgets required modifying existing files

**After**: Easy to extend with new widgets without modifying existing code
```yuck
;; Widget Factory - Open for extension, closed for modification
(defvar widget-registry {
  :cpu cpu-widget
  :memory memory-widget  
  :battery battery-widget
  :network network-widget
  :music music-widget
  ;; Easy to add new widgets here
  :disk disk-widget
})
```

### 3. Liskov Substitution Principle (LSP)

**Before**: Inconsistent widget interfaces

**After**: All widgets follow the same interface contract
```yuck
;; All widgets are interchangeable through base-system-widget
(defwidget base-system-widget [config]
  (box :class {config.class}
       :orientation {config.orientation}
       :halign {config.halign}
    (label :class {str config.class "__icon"} :text {config.icon})
    (label :class {str config.class "__value"} :text {config.value})
  )
)
```

### 4. Interface Segregation Principle (ISP)

**Before**: Widgets had mixed responsibilities

**After**: Focused, minimal interfaces
```yuck
;; Each widget interface is focused and minimal
;; CPU Widget - Only CPU-related data
(defvar cpu-data {
  :icon "󰍛"
  :value {str round(cpu-usage, 0) "%"}
  :class "cpu_info"
})

;; Memory Widget - Only memory-related data  
(defvar memory-data {
  :icon "󰍛"
  :value {str round(memory-usage, 0) "%"}
  :class "mem_info"
})
```

### 5. Dependency Inversion Principle (DIP)

**Before**: Direct dependencies on scripts and styling

**After**: Abstracted data sources and styling
```yuck
;; Data Provider Interface - Abstracts data sources
(defpoll cpu-usage :interval "2s" `scripts/cpu_usage.sh`)
(defvar cpu-data {
  :icon "󰍛"
  :value {str round(cpu-usage, 0) "%"}
  :class "cpu_info"
})

;; Widget depends on abstraction, not concrete implementation
(defwidget cpu-widget []
  (base-system-widget cpu-data)
)
```

## File Structure

```
panel-bar/
├── core/
│   ├── base-widget.yuck          # Base widget interface
│   ├── data-provider.yuck        # Data source abstractions
│   ├── widget-factory.yuck      # Widget creation and registry
│   └── layout-manager.yuck       # Layout management
├── scripts/
│   ├── cpu_usage.sh              # CPU data source
│   ├── memory_usage.sh           # Memory data source
│   ├── battery_level.sh          # Battery data source
│   └── network_speed.sh          # Network data source
└── eww-solid.yuck               # Main SOLID-compliant configuration
```

## Benefits

1. **Maintainability**: Each component has a single, clear responsibility
2. **Extensibility**: Easy to add new widgets without modifying existing code
3. **Testability**: Components can be tested in isolation
4. **Reusability**: Base widgets can be reused across different layouts
5. **Flexibility**: Layout can be changed without affecting widget logic

## Usage

To use the SOLID-compliant version:

1. **Test the new configuration**:
   ```bash
   eww --config panel-bar/eww-solid.yuck daemon
   eww --config panel-bar/eww-solid.yuck open bar
   ```

2. **Add new widgets**:
   - Create data provider in `data-provider.yuck`
   - Add widget to `widget-factory.yuck`
   - Register in `widget-registry`
   - Add to layout in `layout-manager.yuck`

3. **Modify layout**:
   - Update `layout-config` in `layout-manager.yuck`
   - No need to modify individual widgets

## Migration Guide

To migrate from the original configuration:

1. **Backup current configuration**
2. **Test SOLID version alongside original**
3. **Gradually replace components**
4. **Update scripts as needed**
5. **Remove old files once stable**

## Conclusion

The SOLID principles refactoring makes the EWW widget system more maintainable, extensible, and follows software engineering best practices. Each component now has a clear responsibility, making the codebase easier to understand and modify.
