# 🌐 React 19 + Tailwind CSS v4 Component Snippets

> **Copy-paste, production-grade Apple HIG components with Framer Motion spring physics and Liquid Glass styling.**

---

## 1. Apple Button (`AppleButton.tsx`)

```tsx
'use client';
import React from 'react';
import { motion } from 'framer-motion';

interface AppleButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'filled' | 'tinted' | 'glass';
  size?: 'sm' | 'md' | 'lg';
  children: React.ReactNode;
}

export function AppleButton({
  variant = 'filled',
  size = 'md',
  children,
  className = '',
  disabled,
  ...props
}: AppleButtonProps) {
  const sizeStyles = {
    sm: 'h-[36px] px-3.5 text-[14px]',
    md: 'min-h-[44px] px-5 text-[16px]',
    lg: 'min-h-[50px] px-7 text-[17px] font-semibold',
  };

  const variantStyles = {
    filled: 'bg-[#007AFF] text-white hover:bg-[#0066D6] dark:bg-[#0A84FF] dark:hover:bg-[#0077ED] shadow-[0_1px_2px_rgba(0,0,0,0.1)]',
    tinted: 'bg-[#007AFF]/12 text-[#007AFF] hover:bg-[#007AFF]/18 dark:bg-[#0A84FF]/20 dark:text-[#0A84FF]',
    glass: 'bg-white/70 dark:bg-white/10 backdrop-blur-xl border border-white/40 dark:border-white/15 text-black dark:text-white shadow-[0_1px_3px_rgba(0,0,0,0.06)]',
  };

  return (
    <motion.button
      whileHover={disabled ? undefined : { scale: 1.012 }}
      whileTap={disabled ? undefined : { scale: 0.965 }}
      transition={{ type: 'spring', stiffness: 450, damping: 28 }}
      disabled={disabled}
      className={`
        inline-flex items-center justify-center gap-2 rounded-full font-medium select-none
        focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#007AFF] focus-visible:ring-offset-2
        disabled:opacity-35 disabled:cursor-not-allowed
        ${sizeStyles[size]}
        ${variantStyles[variant]}
        ${className}
      `}
      {...props}
    >
      {children}
    </motion.button>
  );
}
```

---

## 2. Apple Segmented Control (`AppleSegmentedControl.tsx`)

```tsx
'use client';
import React from 'react';
import { motion } from 'framer-motion';

interface SegmentedControlProps {
  options: string[];
  selected: string;
  onChange: (val: string) => void;
}

export function AppleSegmentedControl({ options, selected, onChange }: SegmentedControlProps) {
  return (
    <div className="relative inline-flex p-1 bg-[#767680]/12 dark:bg-[#767680]/24 rounded-[12px] select-none">
      {options.map((option) => {
        const isSelected = selected === option;
        return (
          <button
            key={option}
            onClick={() => onChange(option)}
            className={`
              relative z-10 px-4 min-h-[32px] text-[13px] font-medium rounded-[10px] transition-colors duration-150
              ${isSelected ? 'text-black dark:text-white font-semibold' : 'text-[#3C3C43]/60 dark:text-[#EBEBF5]/60 hover:text-black dark:hover:text-white'}
            `}
          >
            {isSelected && (
              <motion.div
                layoutId="segmented-thumb"
                transition={{ type: 'spring', stiffness: 450, damping: 32 }}
                className="absolute inset-0 bg-white dark:bg-[#636366] rounded-[9px] shadow-[0_1px_3px_rgba(0,0,0,0.12),0_1px_2px_rgba(0,0,0,0.06)] -z-10"
              />
            )}
            {option}
          </button>
        );
      })}
    </div>
  );
}
```

---

## 3. Apple Liquid Glass Card (`AppleGlassCard.tsx`)

```tsx
'use client';
import React from 'react';

export function AppleGlassCard({
  children,
  className = '',
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div
      className={`
        relative overflow-hidden rounded-[20px] p-6
        bg-white/72 dark:bg-[#1C1C1E]/75
        backdrop-blur-2xl saturate-[190%]
        border border-white/45 dark:border-white/12
        shadow-[0_1px_2px_rgba(0,0,0,0.04),0_12px_32px_-4px_rgba(0,0,0,0.08),inset_0_1px_1px_0_rgba(255,255,255,0.85)]
        dark:shadow-[0_1px_2px_rgba(0,0,0,0.4),0_16px_40px_-4px_rgba(0,0,0,0.6),inset_0_1px_0.5px_0_rgba(255,255,255,0.15)]
        transition-all duration-300
        ${className}
      `}
    >
      {children}
    </div>
  );
}
```
