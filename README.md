# Advanced Image Processing GUI: Effects Guide

**Author**: Esmail Ahmed Esmail 
**Level**: 3
**Date**: May 2025  

---

## Table of Contents
1. [Noise Effects](#noise-effects)
   - [Salt & Pepper](#salt--pepper)
   - [Gaussian](#gaussian)
   - [Poisson](#poisson)
2. [Point Transform Operations](#point-transform-operations)
   - [Brightness+/Brightness-](#brightnessbrightness-)
   - [Contrast](#contrast)
   - [Histogram & Equalize](#histogram--equalize)
3. [Local Filters](#local-filters)
   - [Low Pass](#low-pass)
   - [High Pass](#high-pass)

---

## Noise Effects

### Salt & Pepper
![Salt & Pepper GUI](assets/salt&pepper.png)  
**Purpose**: Adds random black/white pixels to simulate sensor corruption.  
**How It Works**:  
- Randomly replaces pixels with 0 (pepper) or 255 (salt).  
- Noise density (e.g., 5%) controls affected pixels.  
**Example**:  
- *Before*: Clean image → *After*: Speckled black/white dots.  
**Notes**: Use Median Filter to reduce this noise.  

### Gaussian
![Gaussian Noise GUI](assets/gaussin.png)  
**Purpose**: Adds natural-looking graininess using a normal distribution.  
**How It Works**:  
- Adjusts pixel values with random Gaussian-distributed offsets.  
- Parameters: Mean (usually 0) and variance (controls intensity).  
**Example**:  
- *Before*: Smooth image → *After*: Subtle grain.  

### Poisson
![Poisson Noise GUI](assets/possision.png)  
**Purpose**: Simulates photon noise in low-light conditions.  
**How It Works**:  
- Noise intensity scales with pixel brightness (brighter = more noise).  
**Example**:  
- *Before*: Dark image → *After*: Grainier shadows.  

---

## Point Transform Operations

### Brightness+
![Brightness GUI](assets/bright ++.png)  
**Purpose**: Aggressively lightens (`++`)   
**How It Works**:  
- `Brightness++`: Non-linear curve to maximize luminance.   
**Notes**: May lose details in highlights/shadows.  

### Brightness-
![Brightness GUI](assets/bright--.png)  
**Purpose**: darkens (`--`) the image.  
**How It Works**:   
- `Brightness--`: Crushes shadows for dramatic effects.  
**Notes**: May lose details in highlights/shadows.  

### Contrast
![Contrast GUI](assets/contrast.png)  
**Purpose**: Expands or compresses the tonal range.  
**How It Works**:  
- Stretches histogram to enhance differences between light/dark areas.  
**Example**:  
- *Before*: Flat image → *After*: Vibrant contrast.  

### Histogram & Equalize
![Histogram GUI](assets/histogram.png)  
**Purpose**: Normalizes pixel distribution for balanced contrast.  
**How It Works**:  
- **Histogram**: Visualizes tonal distribution (0–255).  
- **Equalize**: Flattens histogram to use full intensity range.  

---

## Local Filters

### Low Pass
![Low Pass GUI](assets/lowpass.png)  
**Purpose**: Blurs images by suppressing high-frequency details.  
**How It Works**:  
- Convolves image with a smoothing kernel (e.g., Gaussian).  
**Use Case**: Noise reduction or depth-of-field simulation.  

### High Pass
![High Pass GUI](assets/highpass.png)  
**Purpose**: Sharpens edges by isolating high-frequency components.  
**How It Works**:  
- Subtracts a blurred version from the original image.  
**Example**:  
- *Before*: Soft edges → *After*: Enhanced textures.  

---
