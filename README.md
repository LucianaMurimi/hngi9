# Resume 

A resume app containing the following details:
- name / title
- profile picture
- a brief bio
- social media links
- skills

Features:
- The optimal view layout is portrait and switches to landscape depending on the screen size.
- light and dark mode
- social media licks redirecting to respective pages
- animated splash screen

Code description:
The app consists of three screens: splash screen, home page(bio section) and and a second page (skills section) 
- To achieve both dark and light theme, `provider` library has been used; and the theme data passed to the MaterialApp. Provider provided an efficient way of updating states when the theme was switched.
- To achieve animation on the splash screen the `Stack` widget and `AnimatedPositioned` were used.
- `OrientationBuilder` has been used to achieve adaptive orientation
- `url_launcher` has been used to achieve redirection upon pressing social media links

Desirable additional features:
- Localization
- Improved app design

Appetize link https://appetize.io/app/aeig2ba4wjp7474yfccz4nvsie  

