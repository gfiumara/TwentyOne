Twenty One
==========
A Safari content blocker for age gates on iOS and OS X.

Download
--------
 * [OS X Safari Extension](https://raw.githubusercontent.com/gfiumara/TwentyOne/master/SafariExtension/twentyone.safariextz)
 * [iOS App Store](https://itunes.apple.com/us/app/twenty-one-block-age-gates/id1059178930?ls=1&mt=8&at=10l73r)

![Before and after with Twenty One](assets/screenshots/beforeAfter.png)

You're drinking a World Wide Stout from Dogfish and you want to know what the 
ABV was when it was bottled. Over to [Dogfish.com](http://dogfish.com) you go. 
**UGH!**  Before you can get to the information you want, you get to play the
"enter your birthday" game on your tiny iPhone screen, after having a 15%+ beer.

That's where Twenty One can help. Using an open-source, auto-updating block
list, *many* age gates will be blocked from appearing in Safari (and 
SafariViewControllers) on your iPhone and Mac. Now you can get to the 
information you really want without delay.

Why doesn't Twenty One work with [Website]?
-------------------------------------------
It could be that we haven't looked at the website yet
([request it](https://github.com/gfiumara/TwentyOne/issues))! There is a
[list of known unsupported websites](UNSUPPORTED.md) that you should browse 
first.  The reasons boil down to:
 * No one has added that website yet.
 * The website uses cookies to track your age.
 * The website combines other functionality into the age gating, where disabling
   the age gate would make the website not function correctly.

How can I help?
---------------
If you know the basics of CSS and find a site you can fix, please submit a 
[pull request](https://github.com/gfiumara/TwentyOne/pulls) to 
[blockerList.json](SafariExtension/twentyone.safariextension/blockerList.json).
If you don't know what you're doing, feel free to
[submit an issue](https://github.com/gfiumara/TwentyOne/issues)
after confirming that your site has not already been requested. Many thanks to
the generous
[contributors](https://github.com/gfiumara/TwentyOne/graphs/contributors)
who have already helped!

Cheers!
