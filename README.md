# Animated Counter X

A Flutter widget that animates numbers (integers or doubles) from a start value to an end value with customizable duration and direction (increment or decrement).

## Features
- Animate `int` or `double`.
- Configurable start and end values.
- Increment (count up) or decrement (count down) mode.
- Custom animation duration.
- Optional text styling.
- Decimal precision for doubles.
- `onComplete` callback when the counter finishes.
- Optional `prefix` and `suffix` text.

## Installation
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  animated_counter_x: ^0.0.1
```

## Usage

### Increment from 1 → 100 with prefix
```dart
AnimatedCounterX(
  start: 1,
  end: 100,
  duration: Duration(seconds: 5),
  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  increment: true,
  prefix: "\$",
  onComplete: () {
    print('Increment finished!');
  },
)
```