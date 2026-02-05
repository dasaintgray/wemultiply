/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['lib/**/*.dart'],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: '#1E3A8A',
          light: '#3B82F6',
          dark: '#1E40AF',
        },
        secondary: {
          DEFAULT: '#166534',
          light: '#22C55E',
          dark: '#14532D',
        },
        accent: {
          DEFAULT: '#F59E0B',
          light: '#FBBF24',
          dark: '#D97706',
        },
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
